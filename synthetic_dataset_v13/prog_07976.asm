; DESCRIPTION: Renders a green line between points (257, 103) and (436, 245).
; PLAN: r0=257(x1), r1=103(y1), r2=436(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 103
LDI r2, 436
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
