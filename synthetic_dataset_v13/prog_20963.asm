; DESCRIPTION: Places a yellow line segment connecting (96, 144) to (166, 72).
; PLAN: r0=96(x1), r1=144(y1), r2=166(x2), r3=72(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 144
LDI r2, 166
LDI r3, 72
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
