; DESCRIPTION: Renders a blue line between points (373, 233) and (286, 158).
; PLAN: r0=373(x1), r1=233(y1), r2=286(x2), r3=158(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 233
LDI r2, 286
LDI r3, 158
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
