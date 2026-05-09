; DESCRIPTION: Renders a magenta line between points (133, 148) and (315, 39).
; PLAN: r0=133(x1), r1=148(y1), r2=315(x2), r3=39(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 148
LDI r2, 315
LDI r3, 39
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
