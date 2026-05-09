; DESCRIPTION: Draws a cyan line from (497, 188) to (257, 143).
; PLAN: r0=497(x1), r1=188(y1), r2=257(x2), r3=143(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 188
LDI r2, 257
LDI r3, 143
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
