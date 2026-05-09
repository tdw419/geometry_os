; DESCRIPTION: Renders a orange line between points (490, 122) and (220, 49).
; PLAN: r0=490(x1), r1=122(y1), r2=220(x2), r3=49(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 122
LDI r2, 220
LDI r3, 49
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
