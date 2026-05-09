; DESCRIPTION: Draws a orange line from (195, 65) to (361, 21).
; PLAN: r0=195(x1), r1=65(y1), r2=361(x2), r3=21(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 65
LDI r2, 361
LDI r3, 21
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
