; DESCRIPTION: Draws a orange line from (224, 136) to (361, 163).
; PLAN: r0=224(x1), r1=136(y1), r2=361(x2), r3=163(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 136
LDI r2, 361
LDI r3, 163
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
