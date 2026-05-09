; DESCRIPTION: Draws a orange line from (98, 118) to (354, 230).
; PLAN: r0=98(x1), r1=118(y1), r2=354(x2), r3=230(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 118
LDI r2, 354
LDI r3, 230
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
