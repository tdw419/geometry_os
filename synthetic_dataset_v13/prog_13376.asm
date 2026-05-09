; DESCRIPTION: Draws a orange line from (436, 105) to (319, 87).
; PLAN: r0=436(x1), r1=105(y1), r2=319(x2), r3=87(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 105
LDI r2, 319
LDI r3, 87
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
