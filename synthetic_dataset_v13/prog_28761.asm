; DESCRIPTION: Places a blue line segment connecting (436, 186) to (1, 230).
; PLAN: r0=436(x1), r1=186(y1), r2=1(x2), r3=230(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 186
LDI r2, 1
LDI r3, 230
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
