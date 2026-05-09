; DESCRIPTION: Draws a blue line from (369, 23) to (100, 165).
; PLAN: r0=369(x1), r1=23(y1), r2=100(x2), r3=165(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 23
LDI r2, 100
LDI r3, 165
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
