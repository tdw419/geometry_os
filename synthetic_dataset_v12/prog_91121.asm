; DESCRIPTION: Draws a white line from (389, 194) to (257, 12).
; PLAN: r0=389(x1), r1=194(y1), r2=257(x2), r3=12(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 194
LDI r2, 257
LDI r3, 12
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
