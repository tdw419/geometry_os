; DESCRIPTION: Draws a black line from (257, 60) to (63, 226).
; PLAN: r0=257(x1), r1=60(y1), r2=63(x2), r3=226(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 60
LDI r2, 63
LDI r3, 226
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
