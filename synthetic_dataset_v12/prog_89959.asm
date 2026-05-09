; DESCRIPTION: Places a yellow line segment connecting (63, 101) to (438, 144).
; PLAN: r0=63(x1), r1=101(y1), r2=438(x2), r3=144(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 101
LDI r2, 438
LDI r3, 144
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
