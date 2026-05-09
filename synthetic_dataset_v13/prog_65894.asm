; DESCRIPTION: Draws a orange line from (257, 87) to (25, 229).
; PLAN: r0=257(x1), r1=87(y1), r2=25(x2), r3=229(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 87
LDI r2, 25
LDI r3, 229
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
