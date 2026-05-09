; DESCRIPTION: Draws a orange line from (349, 189) to (361, 39).
; PLAN: r0=349(x1), r1=189(y1), r2=361(x2), r3=39(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 189
LDI r2, 361
LDI r3, 39
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
