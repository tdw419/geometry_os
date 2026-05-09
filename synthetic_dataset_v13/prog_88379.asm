; DESCRIPTION: Places a white line segment connecting (32, 110) to (157, 26).
; PLAN: r0=32(x1), r1=110(y1), r2=157(x2), r3=26(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 110
LDI r2, 157
LDI r3, 26
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
