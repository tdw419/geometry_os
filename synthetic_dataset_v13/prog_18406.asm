; DESCRIPTION: Renders a blue line between points (154, 86) and (369, 234).
; PLAN: r0=154(x1), r1=86(y1), r2=369(x2), r3=234(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 86
LDI r2, 369
LDI r3, 234
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
