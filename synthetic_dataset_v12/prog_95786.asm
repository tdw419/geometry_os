; DESCRIPTION: Places a white line segment connecting (142, 33) to (29, 49).
; PLAN: r0=142(x1), r1=33(y1), r2=29(x2), r3=49(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 33
LDI r2, 29
LDI r3, 49
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
