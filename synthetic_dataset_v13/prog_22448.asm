; DESCRIPTION: Draws a orange line from (156, 81) to (373, 129).
; PLAN: r0=156(x1), r1=81(y1), r2=373(x2), r3=129(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 81
LDI r2, 373
LDI r3, 129
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
