; DESCRIPTION: Places a white line segment connecting (51, 49) to (89, 115).
; PLAN: r0=51(x1), r1=49(y1), r2=89(x2), r3=115(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 49
LDI r2, 89
LDI r3, 115
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
