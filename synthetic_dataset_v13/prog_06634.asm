; DESCRIPTION: Places a blue line segment connecting (48, 157) to (93, 71).
; PLAN: r0=48(x1), r1=157(y1), r2=93(x2), r3=71(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 157
LDI r2, 93
LDI r3, 71
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
