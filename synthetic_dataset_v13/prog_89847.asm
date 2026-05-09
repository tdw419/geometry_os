; DESCRIPTION: Draws a orange line from (127, 233) to (436, 201).
; PLAN: r0=127(x1), r1=233(y1), r2=436(x2), r3=201(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 233
LDI r2, 436
LDI r3, 201
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
