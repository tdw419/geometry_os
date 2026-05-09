; DESCRIPTION: Places a white line segment connecting (347, 28) to (179, 36).
; PLAN: r0=347(x1), r1=28(y1), r2=179(x2), r3=36(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 28
LDI r2, 179
LDI r3, 36
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
