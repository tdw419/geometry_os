; DESCRIPTION: Draws a orange line from (382, 156) to (68, 223).
; PLAN: r0=382(x1), r1=156(y1), r2=68(x2), r3=223(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 156
LDI r2, 68
LDI r3, 223
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
