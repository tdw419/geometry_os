; DESCRIPTION: Draws a blue line from (222, 178) to (39, 145).
; PLAN: r0=222(x1), r1=178(y1), r2=39(x2), r3=145(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 178
LDI r2, 39
LDI r3, 145
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
