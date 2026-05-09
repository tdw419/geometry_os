; DESCRIPTION: Places a purple line segment connecting (480, 155) to (59, 176).
; PLAN: r0=480(x1), r1=155(y1), r2=59(x2), r3=176(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 155
LDI r2, 59
LDI r3, 176
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
