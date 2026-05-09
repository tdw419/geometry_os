; DESCRIPTION: Places a green line segment connecting (188, 100) to (332, 144).
; PLAN: r0=188(x1), r1=100(y1), r2=332(x2), r3=144(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 100
LDI r2, 332
LDI r3, 144
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
