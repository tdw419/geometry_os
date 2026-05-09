; DESCRIPTION: Renders a blue line between points (109, 54) and (383, 157).
; PLAN: r0=109(x1), r1=54(y1), r2=383(x2), r3=157(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 54
LDI r2, 383
LDI r3, 157
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
