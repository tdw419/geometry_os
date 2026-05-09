; DESCRIPTION: Renders a orange line between points (117, 181) and (105, 252).
; PLAN: r0=117(x1), r1=181(y1), r2=105(x2), r3=252(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 181
LDI r2, 105
LDI r3, 252
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
