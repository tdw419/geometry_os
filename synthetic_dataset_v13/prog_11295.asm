; DESCRIPTION: Places a black line segment connecting (3, 13) to (498, 238).
; PLAN: r0=3(x1), r1=13(y1), r2=498(x2), r3=238(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 13
LDI r2, 498
LDI r3, 238
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
