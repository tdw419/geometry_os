; DESCRIPTION: Renders a yellow line between points (200, 70) and (274, 49).
; PLAN: r0=200(x1), r1=70(y1), r2=274(x2), r3=49(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 70
LDI r2, 274
LDI r3, 49
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
