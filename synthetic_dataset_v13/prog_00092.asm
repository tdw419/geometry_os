; DESCRIPTION: Renders a magenta line between points (142, 59) and (163, 8).
; PLAN: r0=142(x1), r1=59(y1), r2=163(x2), r3=8(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 59
LDI r2, 163
LDI r3, 8
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
