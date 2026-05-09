; DESCRIPTION: Places a red line segment connecting (464, 217) to (369, 23).
; PLAN: r0=464(x1), r1=217(y1), r2=369(x2), r3=23(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 217
LDI r2, 369
LDI r3, 23
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
