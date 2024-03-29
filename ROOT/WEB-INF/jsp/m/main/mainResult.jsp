<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:choose>
<c:when test="${fn:length(list) > 0}">
<ul class="stat_list mg_b20">
<!-- 
	<li>
		<h2>
			<strong class="ti fs14">${list.VIEW_NAME}</strong>
			<span class="top_count">Target : <strong><fmt:formatNumber value="${list.TARGET_REV}" groupingUsed="true"/></strong></span>
		</h2>
	</li>
 -->
 	<li>
 		<h2><span class="top_count">Target : <fmt:formatNumber value="${list.TARGET_REV / 1000000}" type="currency" currencySymbol=""/>(REV), <fmt:formatNumber value="${list.TARGET_GP / 1000000}" groupingUsed="true"/>(GP)</span>
 		</h2>
 	</li>
	<li>
		<h2 class="subtitle">
			<fmt:parseNumber var="ara" integerOnly="true" value="${list.ACTUAL_REV_AMOUNT}"/>
			<fmt:parseNumber var="tr" integerOnly="true" value="${list.TARGET_REV}"/>
			<span class="sub">REV</span>
			<span class="count">
			<fmt:formatNumber value="${list.ACTUAL_REV_AMOUNT/1000000}" type="currency" currencySymbol=""/>
			<c:choose>
			<c:when test="${list.TARGET_REV > 0}">
			<fmt:parseNumber var="revPer" integerOnly="true" value="${(ara/tr)*100}"/>
			</c:when>
			<c:otherwise>
			<fmt:parseNumber var="revPer" integerOnly="true" value="100"/>
			</c:otherwise>
			</c:choose>
			<span class="stat-percent">(${revPer}%)</span></span>
		</h2>
        <div class="result_total_track">
            <div class="result_progress">
                <div style="width:${revPer}%;" class="bar rev_color"></div>                                                    
                <div class="line_100"></div>
            </div>
        </div>
	</li>
	<li>
		<h2 class="subtitle">
			<fmt:parseNumber var="aga" integerOnly="true" value="${list.ACTUAL_GP_AMOUNT}"/>
		  	<fmt:parseNumber var="tg" integerOnly="true" value="${list.TARGET_GP}"/>
		  	<fmt:parseNumber var="gpPer" integerOnly="true" value="${(aga/tg)*100}"/>
			<span class="sub">GP</span>
			<span class="count"><fmt:formatNumber value="${list.ACTUAL_GP_AMOUNT/1000000}" type="currency" currencySymbol=""/>
			<span class="stat-percent">(${gpPer}%)</span></span>
		</h2>
        <div class="result_total_track">
            <div class="result_progress">
                <div style="width:${gpPer}%;" class="bar gp_color"></div>                                                    
                <div class="line_100"></div>
            </div>
        </div>
	</li>
</ul>
</c:when>
<c:otherwise>


<ul class="stat_list">
<li class="">
	<p class="pd_t20 pd_b20 ta_c">데이터가 없습니다.</p>
</li>
</ul>
</c:otherwise>
</c:choose>
