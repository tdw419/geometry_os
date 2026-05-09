; DESCRIPTION: Places a white line segment connecting (138, 110) to (413, 110).
; PLAN: r0=138(x1), r1=110(y1), r2=413(x2), r3=110(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 110
LDI r2, 413
LDI r3, 110
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
