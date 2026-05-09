; DESCRIPTION: Places a yellow line segment connecting (73, 13) to (184, 100).
; PLAN: r0=73(x1), r1=13(y1), r2=184(x2), r3=100(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 13
LDI r2, 184
LDI r3, 100
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
