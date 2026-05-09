; DESCRIPTION: Places a black line segment connecting (480, 22) to (297, 211).
; PLAN: r0=480(x1), r1=22(y1), r2=297(x2), r3=211(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 22
LDI r2, 297
LDI r3, 211
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
