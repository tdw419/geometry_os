; DESCRIPTION: Renders a orange line between points (15, 105) and (225, 223).
; PLAN: r0=15(x1), r1=105(y1), r2=225(x2), r3=223(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 105
LDI r2, 225
LDI r3, 223
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
