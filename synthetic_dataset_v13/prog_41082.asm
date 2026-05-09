; DESCRIPTION: Draws a purple line from (353, 100) to (256, 214).
; PLAN: r0=353(x1), r1=100(y1), r2=256(x2), r3=214(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 100
LDI r2, 256
LDI r3, 214
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
