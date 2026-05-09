; DESCRIPTION: Places a magenta line segment connecting (369, 175) to (416, 34).
; PLAN: r0=369(x1), r1=175(y1), r2=416(x2), r3=34(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 175
LDI r2, 416
LDI r3, 34
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
