; DESCRIPTION: Places a red line segment connecting (373, 218) to (369, 131).
; PLAN: r0=373(x1), r1=218(y1), r2=369(x2), r3=131(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 218
LDI r2, 369
LDI r3, 131
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
