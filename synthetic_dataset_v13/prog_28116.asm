; DESCRIPTION: Draws a orange line from (372, 194) to (77, 188).
; PLAN: r0=372(x1), r1=194(y1), r2=77(x2), r3=188(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 194
LDI r2, 77
LDI r3, 188
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
