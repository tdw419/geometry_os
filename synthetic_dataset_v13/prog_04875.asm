; DESCRIPTION: Renders a orange line between points (282, 141) and (159, 198).
; PLAN: r0=282(x1), r1=141(y1), r2=159(x2), r3=198(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 141
LDI r2, 159
LDI r3, 198
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
