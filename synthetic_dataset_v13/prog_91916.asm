; DESCRIPTION: Places a yellow line segment connecting (257, 251) to (110, 98).
; PLAN: r0=257(x1), r1=251(y1), r2=110(x2), r3=98(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 251
LDI r2, 110
LDI r3, 98
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
