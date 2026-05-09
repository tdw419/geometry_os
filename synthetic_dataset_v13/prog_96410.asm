; DESCRIPTION: Draws a magenta line from (369, 69) to (142, 43).
; PLAN: r0=369(x1), r1=69(y1), r2=142(x2), r3=43(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 69
LDI r2, 142
LDI r3, 43
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
