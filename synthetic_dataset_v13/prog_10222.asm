; DESCRIPTION: Renders a blue line between points (40, 111) and (444, 230).
; PLAN: r0=40(x1), r1=111(y1), r2=444(x2), r3=230(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 111
LDI r2, 444
LDI r3, 230
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
