; DESCRIPTION: Draws a blue line from (408, 61) to (257, 118).
; PLAN: r0=408(x1), r1=61(y1), r2=257(x2), r3=118(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 61
LDI r2, 257
LDI r3, 118
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
