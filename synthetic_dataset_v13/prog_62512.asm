; DESCRIPTION: Places a black line segment connecting (163, 116) to (274, 130).
; PLAN: r0=163(x1), r1=116(y1), r2=274(x2), r3=130(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 116
LDI r2, 274
LDI r3, 130
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
