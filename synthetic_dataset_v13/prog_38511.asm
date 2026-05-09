; DESCRIPTION: Places a yellow line segment connecting (58, 136) to (128, 25).
; PLAN: r0=58(x1), r1=136(y1), r2=128(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 136
LDI r2, 128
LDI r3, 25
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
