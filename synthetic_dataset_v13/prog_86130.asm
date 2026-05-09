; DESCRIPTION: Places a blue line segment connecting (423, 146) to (369, 204).
; PLAN: r0=423(x1), r1=146(y1), r2=369(x2), r3=204(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 146
LDI r2, 369
LDI r3, 204
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
