; DESCRIPTION: Places a blue line segment connecting (35, 102) to (233, 29).
; PLAN: r0=35(x1), r1=102(y1), r2=233(x2), r3=29(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 102
LDI r2, 233
LDI r3, 29
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
