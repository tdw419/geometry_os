; DESCRIPTION: Places a black line segment connecting (233, 148) to (226, 251).
; PLAN: r0=233(x1), r1=148(y1), r2=226(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 148
LDI r2, 226
LDI r3, 251
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
