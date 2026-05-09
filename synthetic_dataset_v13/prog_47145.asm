; DESCRIPTION: Draws a purple line from (9, 219) to (454, 219).
; PLAN: r0=9(x1), r1=219(y1), r2=454(x2), r3=219(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 219
LDI r2, 454
LDI r3, 219
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
