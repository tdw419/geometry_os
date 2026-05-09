; DESCRIPTION: Draws a blue line from (3, 8) to (384, 145).
; PLAN: r0=3(x1), r1=8(y1), r2=384(x2), r3=145(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 8
LDI r2, 384
LDI r3, 145
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
