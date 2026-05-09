; DESCRIPTION: Places a white line segment connecting (257, 183) to (282, 230).
; PLAN: r0=257(x1), r1=183(y1), r2=282(x2), r3=230(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 183
LDI r2, 282
LDI r3, 230
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
