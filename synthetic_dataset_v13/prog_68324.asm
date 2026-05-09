; DESCRIPTION: Places a red line segment connecting (335, 32) to (312, 165).
; PLAN: r0=335(x1), r1=32(y1), r2=312(x2), r3=165(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 32
LDI r2, 312
LDI r3, 165
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
