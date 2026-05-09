; DESCRIPTION: Places a yellow line segment connecting (120, 72) to (141, 154).
; PLAN: r0=120(x1), r1=72(y1), r2=141(x2), r3=154(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 72
LDI r2, 141
LDI r3, 154
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
