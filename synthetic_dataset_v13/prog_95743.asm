; DESCRIPTION: Draws a purple line from (413, 136) to (299, 37).
; PLAN: r0=413(x1), r1=136(y1), r2=299(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 136
LDI r2, 299
LDI r3, 37
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
