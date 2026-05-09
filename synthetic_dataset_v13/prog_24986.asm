; DESCRIPTION: Renders a blue line between points (321, 4) and (67, 24).
; PLAN: r0=321(x1), r1=4(y1), r2=67(x2), r3=24(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 4
LDI r2, 67
LDI r3, 24
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
