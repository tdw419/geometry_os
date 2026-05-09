; DESCRIPTION: Draws a orange line from (402, 194) to (306, 44).
; PLAN: r0=402(x1), r1=194(y1), r2=306(x2), r3=44(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 194
LDI r2, 306
LDI r3, 44
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
