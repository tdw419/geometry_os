; DESCRIPTION: Places a green line segment connecting (266, 58) to (257, 69).
; PLAN: r0=266(x1), r1=58(y1), r2=257(x2), r3=69(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 58
LDI r2, 257
LDI r3, 69
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
