; DESCRIPTION: Places a white line segment connecting (35, 112) to (7, 31).
; PLAN: r0=35(x1), r1=112(y1), r2=7(x2), r3=31(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 112
LDI r2, 7
LDI r3, 31
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
