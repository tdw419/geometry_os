; DESCRIPTION: Draws a orange line from (64, 77) to (376, 130).
; PLAN: r0=64(x1), r1=77(y1), r2=376(x2), r3=130(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 77
LDI r2, 376
LDI r3, 130
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
