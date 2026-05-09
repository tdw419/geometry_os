; DESCRIPTION: Draws a purple line from (188, 5) to (276, 0).
; PLAN: r0=188(x1), r1=5(y1), r2=276(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 5
LDI r2, 276
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
