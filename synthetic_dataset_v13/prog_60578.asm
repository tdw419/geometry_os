; DESCRIPTION: Places a yellow line segment connecting (137, 47) to (114, 154).
; PLAN: r0=137(x1), r1=47(y1), r2=114(x2), r3=154(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 47
LDI r2, 114
LDI r3, 154
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
