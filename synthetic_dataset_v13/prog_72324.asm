; DESCRIPTION: Draws a white line from (257, 195) to (13, 21).
; PLAN: r0=257(x1), r1=195(y1), r2=13(x2), r3=21(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 195
LDI r2, 13
LDI r3, 21
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
