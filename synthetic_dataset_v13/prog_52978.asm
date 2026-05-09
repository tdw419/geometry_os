; DESCRIPTION: Renders a magenta line between points (369, 55) and (215, 238).
; PLAN: r0=369(x1), r1=55(y1), r2=215(x2), r3=238(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 55
LDI r2, 215
LDI r3, 238
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
