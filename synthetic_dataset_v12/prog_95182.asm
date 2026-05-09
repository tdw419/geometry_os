; DESCRIPTION: Draws a blue line from (185, 12) to (62, 23).
; PLAN: r0=185(x1), r1=12(y1), r2=62(x2), r3=23(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 12
LDI r2, 62
LDI r3, 23
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
