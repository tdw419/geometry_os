; DESCRIPTION: Draws a orange line from (436, 11) to (85, 143).
; PLAN: r0=436(x1), r1=11(y1), r2=85(x2), r3=143(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 11
LDI r2, 85
LDI r3, 143
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
