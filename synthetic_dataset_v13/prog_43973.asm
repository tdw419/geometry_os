; DESCRIPTION: Places a green line segment connecting (257, 74) to (124, 188).
; PLAN: r0=257(x1), r1=74(y1), r2=124(x2), r3=188(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 74
LDI r2, 124
LDI r3, 188
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
