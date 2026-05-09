; DESCRIPTION: Places a white line segment connecting (86, 158) to (371, 60).
; PLAN: r0=86(x1), r1=158(y1), r2=371(x2), r3=60(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 158
LDI r2, 371
LDI r3, 60
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
