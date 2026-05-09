; DESCRIPTION: Places a yellow line segment connecting (494, 237) to (151, 110).
; PLAN: r0=494(x1), r1=237(y1), r2=151(x2), r3=110(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 237
LDI r2, 151
LDI r3, 110
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
