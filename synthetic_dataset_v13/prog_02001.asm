; DESCRIPTION: Draws a orange line from (397, 80) to (167, 130).
; PLAN: r0=397(x1), r1=80(y1), r2=167(x2), r3=130(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 80
LDI r2, 167
LDI r3, 130
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
