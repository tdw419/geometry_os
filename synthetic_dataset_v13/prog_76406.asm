; DESCRIPTION: Draws a magenta line from (310, 76) to (444, 188).
; PLAN: r0=310(x1), r1=76(y1), r2=444(x2), r3=188(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 76
LDI r2, 444
LDI r3, 188
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
