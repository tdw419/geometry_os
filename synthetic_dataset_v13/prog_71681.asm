; DESCRIPTION: Draws a orange line from (63, 77) to (163, 253).
; PLAN: r0=63(x1), r1=77(y1), r2=163(x2), r3=253(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 77
LDI r2, 163
LDI r3, 253
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
