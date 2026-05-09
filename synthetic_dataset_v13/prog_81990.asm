; DESCRIPTION: Places a white line segment connecting (298, 227) to (26, 129).
; PLAN: r0=298(x1), r1=227(y1), r2=26(x2), r3=129(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 227
LDI r2, 26
LDI r3, 129
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
