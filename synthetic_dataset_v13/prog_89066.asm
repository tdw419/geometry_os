; DESCRIPTION: Places a black line segment connecting (463, 96) to (58, 137).
; PLAN: r0=463(x1), r1=96(y1), r2=58(x2), r3=137(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 96
LDI r2, 58
LDI r3, 137
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
