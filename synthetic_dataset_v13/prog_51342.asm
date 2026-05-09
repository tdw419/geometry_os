; DESCRIPTION: Places a white line segment connecting (486, 18) to (297, 155).
; PLAN: r0=486(x1), r1=18(y1), r2=297(x2), r3=155(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 18
LDI r2, 297
LDI r3, 155
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
