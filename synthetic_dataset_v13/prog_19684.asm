; DESCRIPTION: Places a yellow line segment connecting (285, 72) to (144, 222).
; PLAN: r0=285(x1), r1=72(y1), r2=144(x2), r3=222(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 72
LDI r2, 144
LDI r3, 222
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
