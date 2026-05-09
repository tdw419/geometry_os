; DESCRIPTION: Renders a blue line between points (278, 140) and (372, 15).
; PLAN: r0=278(x1), r1=140(y1), r2=372(x2), r3=15(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 140
LDI r2, 372
LDI r3, 15
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
