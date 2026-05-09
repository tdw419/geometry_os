; DESCRIPTION: Draws a magenta line from (125, 105) to (318, 241).
; PLAN: r0=125(x1), r1=105(y1), r2=318(x2), r3=241(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 105
LDI r2, 318
LDI r3, 241
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
