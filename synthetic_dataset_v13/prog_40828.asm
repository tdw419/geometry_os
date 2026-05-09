; DESCRIPTION: Places a white line segment connecting (216, 43) to (382, 194).
; PLAN: r0=216(x1), r1=43(y1), r2=382(x2), r3=194(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 43
LDI r2, 382
LDI r3, 194
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
