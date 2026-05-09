; DESCRIPTION: Renders a yellow line between points (373, 188) and (476, 71).
; PLAN: r0=373(x1), r1=188(y1), r2=476(x2), r3=71(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 188
LDI r2, 476
LDI r3, 71
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
