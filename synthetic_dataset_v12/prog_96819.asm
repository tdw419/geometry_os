; DESCRIPTION: Places a yellow line segment connecting (345, 76) to (21, 191).
; PLAN: r0=345(x1), r1=76(y1), r2=21(x2), r3=191(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 76
LDI r2, 21
LDI r3, 191
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
