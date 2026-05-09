; DESCRIPTION: Places a black line segment connecting (163, 222) to (309, 90).
; PLAN: r0=163(x1), r1=222(y1), r2=309(x2), r3=90(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 222
LDI r2, 309
LDI r3, 90
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
