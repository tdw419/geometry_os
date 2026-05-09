; DESCRIPTION: Draws a blue line from (84, 111) to (351, 3).
; PLAN: r0=84(x1), r1=111(y1), r2=351(x2), r3=3(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 111
LDI r2, 351
LDI r3, 3
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
