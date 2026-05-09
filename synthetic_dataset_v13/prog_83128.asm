; DESCRIPTION: Places a yellow line segment connecting (14, 1) to (257, 24).
; PLAN: r0=14(x1), r1=1(y1), r2=257(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 1
LDI r2, 257
LDI r3, 24
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
