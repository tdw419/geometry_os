; DESCRIPTION: Places a black line segment connecting (269, 2) to (77, 248).
; PLAN: r0=269(x1), r1=2(y1), r2=77(x2), r3=248(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 2
LDI r2, 77
LDI r3, 248
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
