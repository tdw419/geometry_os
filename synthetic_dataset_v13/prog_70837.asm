; DESCRIPTION: Places a magenta line segment connecting (257, 184) to (289, 39).
; PLAN: r0=257(x1), r1=184(y1), r2=289(x2), r3=39(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 184
LDI r2, 289
LDI r3, 39
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
