; DESCRIPTION: Places a magenta line segment connecting (369, 46) to (170, 152).
; PLAN: r0=369(x1), r1=46(y1), r2=170(x2), r3=152(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 46
LDI r2, 170
LDI r3, 152
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
