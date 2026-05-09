; DESCRIPTION: Places a white line segment connecting (101, 248) to (37, 92).
; PLAN: r0=101(x1), r1=248(y1), r2=37(x2), r3=92(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 248
LDI r2, 37
LDI r3, 92
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
