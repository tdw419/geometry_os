; DESCRIPTION: Draws a orange line from (506, 42) to (163, 17).
; PLAN: r0=506(x1), r1=42(y1), r2=163(x2), r3=17(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 42
LDI r2, 163
LDI r3, 17
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
