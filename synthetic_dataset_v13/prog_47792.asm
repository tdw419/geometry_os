; DESCRIPTION: Places a red line segment connecting (143, 34) to (506, 224).
; PLAN: r0=143(x1), r1=34(y1), r2=506(x2), r3=224(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 34
LDI r2, 506
LDI r3, 224
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
