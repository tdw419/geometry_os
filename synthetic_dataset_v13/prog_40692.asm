; DESCRIPTION: Places a magenta line segment connecting (369, 95) to (251, 104).
; PLAN: r0=369(x1), r1=95(y1), r2=251(x2), r3=104(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 95
LDI r2, 251
LDI r3, 104
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
