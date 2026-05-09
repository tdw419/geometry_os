; DESCRIPTION: Places a yellow line segment connecting (448, 136) to (13, 154).
; PLAN: r0=448(x1), r1=136(y1), r2=13(x2), r3=154(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 136
LDI r2, 13
LDI r3, 154
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
