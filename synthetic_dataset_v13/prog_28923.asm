; DESCRIPTION: Places a white line segment connecting (256, 175) to (163, 145).
; PLAN: r0=256(x1), r1=175(y1), r2=163(x2), r3=145(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 175
LDI r2, 163
LDI r3, 145
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
