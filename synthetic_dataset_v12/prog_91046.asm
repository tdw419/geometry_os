; DESCRIPTION: Renders a orange line between points (172, 49) and (420, 216).
; PLAN: r0=172(x1), r1=49(y1), r2=420(x2), r3=216(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 49
LDI r2, 420
LDI r3, 216
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
