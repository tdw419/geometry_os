; DESCRIPTION: Places a white line segment connecting (104, 142) to (339, 248).
; PLAN: r0=104(x1), r1=142(y1), r2=339(x2), r3=248(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 142
LDI r2, 339
LDI r3, 248
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
