; DESCRIPTION: Places a blue line segment connecting (35, 154) to (388, 98).
; PLAN: r0=35(x1), r1=154(y1), r2=388(x2), r3=98(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 154
LDI r2, 388
LDI r3, 98
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
