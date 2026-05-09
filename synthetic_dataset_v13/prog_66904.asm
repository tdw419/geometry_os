; DESCRIPTION: Places a white line segment connecting (43, 251) to (194, 51).
; PLAN: r0=43(x1), r1=251(y1), r2=194(x2), r3=51(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 251
LDI r2, 194
LDI r3, 51
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
