; DESCRIPTION: Places a white line segment connecting (17, 17) to (457, 19).
; PLAN: r0=17(x1), r1=17(y1), r2=457(x2), r3=19(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 17
LDI r2, 457
LDI r3, 19
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
