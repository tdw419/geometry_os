; DESCRIPTION: Places a white line segment connecting (30, 200) to (84, 114).
; PLAN: r0=30(x1), r1=200(y1), r2=84(x2), r3=114(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 200
LDI r2, 84
LDI r3, 114
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
