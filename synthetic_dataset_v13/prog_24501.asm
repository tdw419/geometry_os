; DESCRIPTION: Places a yellow line segment connecting (186, 22) to (202, 179).
; PLAN: r0=186(x1), r1=22(y1), r2=202(x2), r3=179(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 22
LDI r2, 202
LDI r3, 179
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
