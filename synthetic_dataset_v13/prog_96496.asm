; DESCRIPTION: Places a black line segment connecting (181, 145) to (194, 16).
; PLAN: r0=181(x1), r1=145(y1), r2=194(x2), r3=16(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 145
LDI r2, 194
LDI r3, 16
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
