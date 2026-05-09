; DESCRIPTION: Places a black line segment connecting (148, 90) to (439, 116).
; PLAN: r0=148(x1), r1=90(y1), r2=439(x2), r3=116(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 90
LDI r2, 439
LDI r3, 116
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
