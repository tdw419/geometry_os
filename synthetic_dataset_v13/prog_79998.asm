; DESCRIPTION: Draws a orange line from (157, 136) to (330, 79).
; PLAN: r0=157(x1), r1=136(y1), r2=330(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 136
LDI r2, 330
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
