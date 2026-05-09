; DESCRIPTION: Places a yellow line segment connecting (299, 88) to (176, 89).
; PLAN: r0=299(x1), r1=88(y1), r2=176(x2), r3=89(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 88
LDI r2, 176
LDI r3, 89
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
