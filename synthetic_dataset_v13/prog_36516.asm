; DESCRIPTION: Places a white line segment connecting (313, 28) to (216, 189).
; PLAN: r0=313(x1), r1=28(y1), r2=216(x2), r3=189(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 28
LDI r2, 216
LDI r3, 189
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
