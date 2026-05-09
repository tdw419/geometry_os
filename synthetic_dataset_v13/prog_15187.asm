; DESCRIPTION: Places a green line segment connecting (506, 71) to (484, 116).
; PLAN: r0=506(x1), r1=71(y1), r2=484(x2), r3=116(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 71
LDI r2, 484
LDI r3, 116
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
