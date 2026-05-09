; DESCRIPTION: Places a blue line segment connecting (70, 240) to (353, 176).
; PLAN: r0=70(x1), r1=240(y1), r2=353(x2), r3=176(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 240
LDI r2, 353
LDI r3, 176
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
