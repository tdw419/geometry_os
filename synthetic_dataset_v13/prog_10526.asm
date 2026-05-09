; DESCRIPTION: Renders a orange line between points (428, 20) and (252, 230).
; PLAN: r0=428(x1), r1=20(y1), r2=252(x2), r3=230(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 20
LDI r2, 252
LDI r3, 230
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
