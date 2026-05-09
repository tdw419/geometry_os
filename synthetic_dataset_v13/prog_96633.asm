; DESCRIPTION: Places a black line segment connecting (58, 205) to (118, 109).
; PLAN: r0=58(x1), r1=205(y1), r2=118(x2), r3=109(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 205
LDI r2, 118
LDI r3, 109
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
