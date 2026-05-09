; DESCRIPTION: Draws a purple line from (268, 11) to (400, 90).
; PLAN: r0=268(x1), r1=11(y1), r2=400(x2), r3=90(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 11
LDI r2, 400
LDI r3, 90
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
