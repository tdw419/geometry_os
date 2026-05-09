; DESCRIPTION: Renders a yellow line between points (253, 32) and (490, 84).
; PLAN: r0=253(x1), r1=32(y1), r2=490(x2), r3=84(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 32
LDI r2, 490
LDI r3, 84
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
