; DESCRIPTION: Places a white line segment connecting (142, 16) to (2, 88).
; PLAN: r0=142(x1), r1=16(y1), r2=2(x2), r3=88(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 16
LDI r2, 2
LDI r3, 88
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
