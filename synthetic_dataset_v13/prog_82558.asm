; DESCRIPTION: Draws a purple line from (375, 145) to (361, 167).
; PLAN: r0=375(x1), r1=145(y1), r2=361(x2), r3=167(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 145
LDI r2, 361
LDI r3, 167
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
