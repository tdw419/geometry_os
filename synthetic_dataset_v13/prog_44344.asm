; DESCRIPTION: Places a yellow line segment connecting (280, 251) to (188, 169).
; PLAN: r0=280(x1), r1=251(y1), r2=188(x2), r3=169(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 251
LDI r2, 188
LDI r3, 169
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
