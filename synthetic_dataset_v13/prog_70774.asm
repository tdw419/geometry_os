; DESCRIPTION: Places a black line segment connecting (506, 61) to (331, 116).
; PLAN: r0=506(x1), r1=61(y1), r2=331(x2), r3=116(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 61
LDI r2, 331
LDI r3, 116
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
