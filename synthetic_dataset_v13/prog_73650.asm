; DESCRIPTION: Draws a orange line from (136, 86) to (142, 15).
; PLAN: r0=136(x1), r1=86(y1), r2=142(x2), r3=15(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 86
LDI r2, 142
LDI r3, 15
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
