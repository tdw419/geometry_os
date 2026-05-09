; DESCRIPTION: Places a blue line segment connecting (388, 240) to (0, 47).
; PLAN: r0=388(x1), r1=240(y1), r2=0(x2), r3=47(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 240
LDI r2, 0
LDI r3, 47
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
