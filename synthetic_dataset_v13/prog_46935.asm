; DESCRIPTION: Places a magenta line segment connecting (369, 154) to (124, 165).
; PLAN: r0=369(x1), r1=154(y1), r2=124(x2), r3=165(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 154
LDI r2, 124
LDI r3, 165
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
