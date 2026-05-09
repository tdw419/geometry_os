; DESCRIPTION: Renders a blue line between points (178, 102) and (72, 163).
; PLAN: r0=178(x1), r1=102(y1), r2=72(x2), r3=163(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 102
LDI r2, 72
LDI r3, 163
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
