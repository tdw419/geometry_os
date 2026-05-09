; DESCRIPTION: Places a blue line segment connecting (74, 163) to (33, 59).
; PLAN: r0=74(x1), r1=163(y1), r2=33(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 163
LDI r2, 33
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
