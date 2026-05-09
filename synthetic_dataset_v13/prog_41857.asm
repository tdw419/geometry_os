; DESCRIPTION: Renders a purple line between points (43, 255) and (285, 100).
; PLAN: r0=43(x1), r1=255(y1), r2=285(x2), r3=100(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 255
LDI r2, 285
LDI r3, 100
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
