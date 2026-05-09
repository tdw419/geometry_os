; DESCRIPTION: Places a white line segment connecting (7, 74) to (185, 62).
; PLAN: r0=7(x1), r1=74(y1), r2=185(x2), r3=62(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 74
LDI r2, 185
LDI r3, 62
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
