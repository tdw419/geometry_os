; DESCRIPTION: Places a white line segment connecting (364, 137) to (179, 7).
; PLAN: r0=364(x1), r1=137(y1), r2=179(x2), r3=7(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 137
LDI r2, 179
LDI r3, 7
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
