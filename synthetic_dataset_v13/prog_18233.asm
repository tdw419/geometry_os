; DESCRIPTION: Draws a blue line from (369, 46) to (442, 22).
; PLAN: r0=369(x1), r1=46(y1), r2=442(x2), r3=22(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 46
LDI r2, 442
LDI r3, 22
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
