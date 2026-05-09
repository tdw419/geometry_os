; DESCRIPTION: Places a black line segment connecting (416, 156) to (172, 51).
; PLAN: r0=416(x1), r1=156(y1), r2=172(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 156
LDI r2, 172
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
