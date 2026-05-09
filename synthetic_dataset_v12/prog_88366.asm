; DESCRIPTION: Draws a blue line from (145, 219) to (283, 90).
; PLAN: r0=145(x1), r1=219(y1), r2=283(x2), r3=90(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 219
LDI r2, 283
LDI r3, 90
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
