; DESCRIPTION: Places a red line segment connecting (178, 219) to (369, 96).
; PLAN: r0=178(x1), r1=219(y1), r2=369(x2), r3=96(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 219
LDI r2, 369
LDI r3, 96
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
