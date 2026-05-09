; DESCRIPTION: Places a yellow line segment connecting (8, 159) to (369, 154).
; PLAN: r0=8(x1), r1=159(y1), r2=369(x2), r3=154(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 159
LDI r2, 369
LDI r3, 154
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
