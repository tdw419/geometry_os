; DESCRIPTION: Places a white line segment connecting (286, 37) to (381, 104).
; PLAN: r0=286(x1), r1=37(y1), r2=381(x2), r3=104(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 37
LDI r2, 381
LDI r3, 104
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
