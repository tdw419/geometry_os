; DESCRIPTION: Places a yellow line segment connecting (81, 186) to (308, 154).
; PLAN: r0=81(x1), r1=186(y1), r2=308(x2), r3=154(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 186
LDI r2, 308
LDI r3, 154
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
