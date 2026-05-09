; DESCRIPTION: Places a blue line segment connecting (388, 246) to (382, 59).
; PLAN: r0=388(x1), r1=246(y1), r2=382(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 246
LDI r2, 382
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
