; DESCRIPTION: Places a black line segment connecting (388, 241) to (192, 226).
; PLAN: r0=388(x1), r1=241(y1), r2=192(x2), r3=226(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 241
LDI r2, 192
LDI r3, 226
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
