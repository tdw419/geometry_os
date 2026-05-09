; DESCRIPTION: Draws a orange line from (188, 56) to (150, 129).
; PLAN: r0=188(x1), r1=56(y1), r2=150(x2), r3=129(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 56
LDI r2, 150
LDI r3, 129
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
