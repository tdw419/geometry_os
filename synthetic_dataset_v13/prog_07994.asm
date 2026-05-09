; DESCRIPTION: Draws a green line from (257, 97) to (286, 90).
; PLAN: r0=257(x1), r1=97(y1), r2=286(x2), r3=90(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 97
LDI r2, 286
LDI r3, 90
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
