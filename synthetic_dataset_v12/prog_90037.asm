; DESCRIPTION: Places a white line segment connecting (469, 75) to (192, 120).
; PLAN: r0=469(x1), r1=75(y1), r2=192(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 75
LDI r2, 192
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
