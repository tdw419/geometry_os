; DESCRIPTION: Places a black line segment connecting (141, 88) to (290, 109).
; PLAN: r0=141(x1), r1=88(y1), r2=290(x2), r3=109(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 88
LDI r2, 290
LDI r3, 109
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
