; DESCRIPTION: Places a red line segment connecting (141, 248) to (376, 149).
; PLAN: r0=141(x1), r1=248(y1), r2=376(x2), r3=149(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 248
LDI r2, 376
LDI r3, 149
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
