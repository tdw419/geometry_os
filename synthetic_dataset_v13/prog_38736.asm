; DESCRIPTION: Draws a purple line from (361, 152) to (375, 136).
; PLAN: r0=361(x1), r1=152(y1), r2=375(x2), r3=136(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 152
LDI r2, 375
LDI r3, 136
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
