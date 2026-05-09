; DESCRIPTION: Places a yellow line segment connecting (32, 188) to (100, 73).
; PLAN: r0=32(x1), r1=188(y1), r2=100(x2), r3=73(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 188
LDI r2, 100
LDI r3, 73
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
