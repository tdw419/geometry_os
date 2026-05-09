; DESCRIPTION: Places a red line segment connecting (122, 156) to (73, 253).
; PLAN: r0=122(x1), r1=156(y1), r2=73(x2), r3=253(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 156
LDI r2, 73
LDI r3, 253
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
