; DESCRIPTION: Places a green line segment connecting (184, 8) to (219, 101).
; PLAN: r0=184(x1), r1=8(y1), r2=219(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 8
LDI r2, 219
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
