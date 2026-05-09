; DESCRIPTION: Places a black line segment connecting (23, 238) to (297, 0).
; PLAN: r0=23(x1), r1=238(y1), r2=297(x2), r3=0(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 238
LDI r2, 297
LDI r3, 0
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
