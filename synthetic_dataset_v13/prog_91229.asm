; DESCRIPTION: Places a black line segment connecting (248, 30) to (112, 12).
; PLAN: r0=248(x1), r1=30(y1), r2=112(x2), r3=12(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 30
LDI r2, 112
LDI r3, 12
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
