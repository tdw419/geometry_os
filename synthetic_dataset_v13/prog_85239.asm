; DESCRIPTION: Draws a blue line from (141, 245) to (257, 207).
; PLAN: r0=141(x1), r1=245(y1), r2=257(x2), r3=207(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 245
LDI r2, 257
LDI r3, 207
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
