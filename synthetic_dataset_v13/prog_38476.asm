; DESCRIPTION: Places a yellow line segment connecting (70, 137) to (176, 156).
; PLAN: r0=70(x1), r1=137(y1), r2=176(x2), r3=156(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 137
LDI r2, 176
LDI r3, 156
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
