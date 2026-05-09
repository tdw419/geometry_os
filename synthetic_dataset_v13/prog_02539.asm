; DESCRIPTION: Draws a orange line from (52, 176) to (250, 165).
; PLAN: r0=52(x1), r1=176(y1), r2=250(x2), r3=165(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 176
LDI r2, 250
LDI r3, 165
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
