; DESCRIPTION: Places a blue line segment connecting (473, 61) to (68, 96).
; PLAN: r0=473(x1), r1=61(y1), r2=68(x2), r3=96(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 61
LDI r2, 68
LDI r3, 96
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
