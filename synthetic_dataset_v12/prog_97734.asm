; DESCRIPTION: Draws a orange line from (361, 125) to (4, 32).
; PLAN: r0=361(x1), r1=125(y1), r2=4(x2), r3=32(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 125
LDI r2, 4
LDI r3, 32
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
