; DESCRIPTION: Draws a purple line from (275, 150) to (122, 156).
; PLAN: r0=275(x1), r1=150(y1), r2=122(x2), r3=156(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 150
LDI r2, 122
LDI r3, 156
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
