; DESCRIPTION: Draws a orange line from (187, 234) to (454, 203).
; PLAN: r0=187(x1), r1=234(y1), r2=454(x2), r3=203(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 234
LDI r2, 454
LDI r3, 203
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
