; DESCRIPTION: Places a white line segment connecting (32, 3) to (472, 104).
; PLAN: r0=32(x1), r1=3(y1), r2=472(x2), r3=104(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 3
LDI r2, 472
LDI r3, 104
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
