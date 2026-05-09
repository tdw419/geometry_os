; DESCRIPTION: Draws a purple line from (158, 219) to (356, 214).
; PLAN: r0=158(x1), r1=219(y1), r2=356(x2), r3=214(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 219
LDI r2, 356
LDI r3, 214
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
