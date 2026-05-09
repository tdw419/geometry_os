; DESCRIPTION: Renders a orange line between points (32, 12) and (490, 136).
; PLAN: r0=32(x1), r1=12(y1), r2=490(x2), r3=136(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 12
LDI r2, 490
LDI r3, 136
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
