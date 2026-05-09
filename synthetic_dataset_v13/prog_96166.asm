; DESCRIPTION: Places a white line segment connecting (1, 31) to (211, 118).
; PLAN: r0=1(x1), r1=31(y1), r2=211(x2), r3=118(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 31
LDI r2, 211
LDI r3, 118
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
