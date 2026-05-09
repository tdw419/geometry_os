; DESCRIPTION: Places a black line segment connecting (24, 115) to (341, 141).
; PLAN: r0=24(x1), r1=115(y1), r2=341(x2), r3=141(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 115
LDI r2, 341
LDI r3, 141
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
