; DESCRIPTION: Places a white line segment connecting (18, 105) to (33, 211).
; PLAN: r0=18(x1), r1=105(y1), r2=33(x2), r3=211(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 105
LDI r2, 33
LDI r3, 211
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
