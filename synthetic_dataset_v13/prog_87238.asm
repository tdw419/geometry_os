; DESCRIPTION: Places a magenta line segment connecting (174, 243) to (369, 69).
; PLAN: r0=174(x1), r1=243(y1), r2=369(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 243
LDI r2, 369
LDI r3, 69
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
