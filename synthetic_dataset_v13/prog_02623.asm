; DESCRIPTION: Places a black line segment connecting (233, 60) to (473, 194).
; PLAN: r0=233(x1), r1=60(y1), r2=473(x2), r3=194(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 60
LDI r2, 473
LDI r3, 194
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
