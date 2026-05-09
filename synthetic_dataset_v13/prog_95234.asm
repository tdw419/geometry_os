; DESCRIPTION: Renders a black line between points (233, 255) and (112, 140).
; PLAN: r0=233(x1), r1=255(y1), r2=112(x2), r3=140(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 255
LDI r2, 112
LDI r3, 140
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
