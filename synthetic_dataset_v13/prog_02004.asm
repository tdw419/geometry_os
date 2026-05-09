; DESCRIPTION: Places a black line segment connecting (297, 141) to (99, 10).
; PLAN: r0=297(x1), r1=141(y1), r2=99(x2), r3=10(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 141
LDI r2, 99
LDI r3, 10
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
