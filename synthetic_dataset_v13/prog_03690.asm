; DESCRIPTION: Draws a orange line from (194, 219) to (2, 170).
; PLAN: r0=194(x1), r1=219(y1), r2=2(x2), r3=170(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 219
LDI r2, 2
LDI r3, 170
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
