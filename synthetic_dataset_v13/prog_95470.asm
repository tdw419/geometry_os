; DESCRIPTION: Places a black line segment connecting (177, 222) to (163, 233).
; PLAN: r0=177(x1), r1=222(y1), r2=163(x2), r3=233(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 222
LDI r2, 163
LDI r3, 233
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
