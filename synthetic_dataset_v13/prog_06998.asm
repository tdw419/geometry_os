; DESCRIPTION: Draws a blue line from (178, 188) to (369, 168).
; PLAN: r0=178(x1), r1=188(y1), r2=369(x2), r3=168(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 188
LDI r2, 369
LDI r3, 168
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
