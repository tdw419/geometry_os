; DESCRIPTION: Places a black line segment connecting (40, 220) to (297, 102).
; PLAN: r0=40(x1), r1=220(y1), r2=297(x2), r3=102(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 220
LDI r2, 297
LDI r3, 102
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
