; DESCRIPTION: Places a black line segment connecting (440, 222) to (194, 189).
; PLAN: r0=440(x1), r1=222(y1), r2=194(x2), r3=189(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 222
LDI r2, 194
LDI r3, 189
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
