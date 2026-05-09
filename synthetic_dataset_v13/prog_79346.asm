; DESCRIPTION: Places a yellow line segment connecting (158, 249) to (64, 154).
; PLAN: r0=158(x1), r1=249(y1), r2=64(x2), r3=154(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 249
LDI r2, 64
LDI r3, 154
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
