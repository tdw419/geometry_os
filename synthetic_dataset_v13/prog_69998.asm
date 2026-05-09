; DESCRIPTION: Draws a orange line from (361, 155) to (64, 83).
; PLAN: r0=361(x1), r1=155(y1), r2=64(x2), r3=83(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 155
LDI r2, 64
LDI r3, 83
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
