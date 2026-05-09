; DESCRIPTION: Renders a yellow line between points (163, 60) and (373, 6).
; PLAN: r0=163(x1), r1=60(y1), r2=373(x2), r3=6(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 60
LDI r2, 373
LDI r3, 6
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
