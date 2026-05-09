; DESCRIPTION: Renders a blue line between points (383, 73) and (163, 160).
; PLAN: r0=383(x1), r1=73(y1), r2=163(x2), r3=160(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 73
LDI r2, 163
LDI r3, 160
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
