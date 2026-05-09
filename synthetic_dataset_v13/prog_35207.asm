; DESCRIPTION: Draws a purple line from (332, 156) to (69, 9).
; PLAN: r0=332(x1), r1=156(y1), r2=69(x2), r3=9(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 156
LDI r2, 69
LDI r3, 9
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
