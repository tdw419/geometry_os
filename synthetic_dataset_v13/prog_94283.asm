; DESCRIPTION: Renders a orange line between points (74, 216) and (182, 155).
; PLAN: r0=74(x1), r1=216(y1), r2=182(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 216
LDI r2, 182
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
