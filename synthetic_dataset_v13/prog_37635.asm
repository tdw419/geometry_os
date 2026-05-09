; DESCRIPTION: Places a yellow line segment connecting (240, 24) to (418, 22).
; PLAN: r0=240(x1), r1=24(y1), r2=418(x2), r3=22(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 24
LDI r2, 418
LDI r3, 22
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
