; DESCRIPTION: Renders a purple line between points (57, 28) and (302, 1).
; PLAN: r0=57(x1), r1=28(y1), r2=302(x2), r3=1(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 28
LDI r2, 302
LDI r3, 1
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
