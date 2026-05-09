; DESCRIPTION: Renders a blue line between points (29, 4) and (256, 90).
; PLAN: r0=29(x1), r1=4(y1), r2=256(x2), r3=90(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 4
LDI r2, 256
LDI r3, 90
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
