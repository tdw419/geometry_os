; DESCRIPTION: Places a blue line segment connecting (320, 240) to (155, 212).
; PLAN: r0=320(x1), r1=240(y1), r2=155(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 240
LDI r2, 155
LDI r3, 212
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
