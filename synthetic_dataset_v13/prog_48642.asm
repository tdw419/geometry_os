; DESCRIPTION: Renders a blue line between points (431, 93) and (1, 49).
; PLAN: r0=431(x1), r1=93(y1), r2=1(x2), r3=49(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 93
LDI r2, 1
LDI r3, 49
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
