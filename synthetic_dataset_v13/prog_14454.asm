; DESCRIPTION: Renders a blue line between points (62, 83) and (3, 164).
; PLAN: r0=62(x1), r1=83(y1), r2=3(x2), r3=164(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 83
LDI r2, 3
LDI r3, 164
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
