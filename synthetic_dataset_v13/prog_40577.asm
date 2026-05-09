; DESCRIPTION: Draws a blue line from (501, 8) to (30, 163).
; PLAN: r0=501(x1), r1=8(y1), r2=30(x2), r3=163(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 8
LDI r2, 30
LDI r3, 163
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
