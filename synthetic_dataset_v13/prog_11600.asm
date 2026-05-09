; DESCRIPTION: Draws a blue line from (257, 179) to (292, 251).
; PLAN: r0=257(x1), r1=179(y1), r2=292(x2), r3=251(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 179
LDI r2, 292
LDI r3, 251
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
