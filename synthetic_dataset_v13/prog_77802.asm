; DESCRIPTION: Places a black line segment connecting (201, 28) to (93, 14).
; PLAN: r0=201(x1), r1=28(y1), r2=93(x2), r3=14(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 28
LDI r2, 93
LDI r3, 14
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
