; DESCRIPTION: Renders a white line between points (114, 41) and (503, 38).
; PLAN: r0=114(x1), r1=41(y1), r2=503(x2), r3=38(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 41
LDI r2, 503
LDI r3, 38
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
