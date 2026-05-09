; DESCRIPTION: Renders a orange line between points (9, 70) and (459, 230).
; PLAN: r0=9(x1), r1=70(y1), r2=459(x2), r3=230(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 70
LDI r2, 459
LDI r3, 230
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
