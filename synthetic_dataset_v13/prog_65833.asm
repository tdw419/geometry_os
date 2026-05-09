; DESCRIPTION: Places a blue line segment connecting (188, 227) to (446, 61).
; PLAN: r0=188(x1), r1=227(y1), r2=446(x2), r3=61(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 227
LDI r2, 446
LDI r3, 61
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
