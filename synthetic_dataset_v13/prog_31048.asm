; DESCRIPTION: Places a black line segment connecting (182, 136) to (226, 45).
; PLAN: r0=182(x1), r1=136(y1), r2=226(x2), r3=45(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 136
LDI r2, 226
LDI r3, 45
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
