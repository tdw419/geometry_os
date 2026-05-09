; DESCRIPTION: Draws a blue line from (40, 140) to (419, 163).
; PLAN: r0=40(x1), r1=140(y1), r2=419(x2), r3=163(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 140
LDI r2, 419
LDI r3, 163
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
