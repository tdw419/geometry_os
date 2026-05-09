; DESCRIPTION: Places a yellow line segment connecting (28, 32) to (457, 60).
; PLAN: r0=28(x1), r1=32(y1), r2=457(x2), r3=60(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 32
LDI r2, 457
LDI r3, 60
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
