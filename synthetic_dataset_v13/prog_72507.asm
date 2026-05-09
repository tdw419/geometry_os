; DESCRIPTION: Places a red line segment connecting (369, 196) to (133, 30).
; PLAN: r0=369(x1), r1=196(y1), r2=133(x2), r3=30(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 196
LDI r2, 133
LDI r3, 30
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
