; DESCRIPTION: Places a black line segment connecting (158, 153) to (454, 57).
; PLAN: r0=158(x1), r1=153(y1), r2=454(x2), r3=57(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 153
LDI r2, 454
LDI r3, 57
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
