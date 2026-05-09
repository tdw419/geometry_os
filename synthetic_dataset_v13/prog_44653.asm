; DESCRIPTION: Draws a blue line from (193, 219) to (100, 135).
; PLAN: r0=193(x1), r1=219(y1), r2=100(x2), r3=135(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 219
LDI r2, 100
LDI r3, 135
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
