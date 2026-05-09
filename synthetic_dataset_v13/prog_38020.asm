; DESCRIPTION: Places a blue line segment connecting (473, 120) to (90, 39).
; PLAN: r0=473(x1), r1=120(y1), r2=90(x2), r3=39(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 120
LDI r2, 90
LDI r3, 39
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
