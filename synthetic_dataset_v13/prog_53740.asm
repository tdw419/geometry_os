; DESCRIPTION: Places a white line segment connecting (263, 77) to (457, 15).
; PLAN: r0=263(x1), r1=77(y1), r2=457(x2), r3=15(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 77
LDI r2, 457
LDI r3, 15
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
