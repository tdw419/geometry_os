; DESCRIPTION: Places a blue line segment connecting (34, 98) to (24, 65).
; PLAN: r0=34(x1), r1=98(y1), r2=24(x2), r3=65(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 98
LDI r2, 24
LDI r3, 65
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
