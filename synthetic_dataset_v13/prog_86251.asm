; DESCRIPTION: Renders a blue line between points (373, 36) and (505, 102).
; PLAN: r0=373(x1), r1=36(y1), r2=505(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 36
LDI r2, 505
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
