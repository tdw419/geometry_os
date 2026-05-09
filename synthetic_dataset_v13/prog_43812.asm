; DESCRIPTION: Places a white line segment connecting (2, 217) to (240, 34).
; PLAN: r0=2(x1), r1=217(y1), r2=240(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 217
LDI r2, 240
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
