; DESCRIPTION: Draws a orange line from (357, 185) to (320, 72).
; PLAN: r0=357(x1), r1=185(y1), r2=320(x2), r3=72(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 185
LDI r2, 320
LDI r3, 72
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
