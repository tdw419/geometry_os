; DESCRIPTION: Renders a orange line between points (411, 44) and (172, 223).
; PLAN: r0=411(x1), r1=44(y1), r2=172(x2), r3=223(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 44
LDI r2, 172
LDI r3, 223
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
