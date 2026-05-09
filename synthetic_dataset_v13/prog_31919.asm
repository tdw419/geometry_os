; DESCRIPTION: Renders a yellow line between points (457, 14) and (44, 237).
; PLAN: r0=457(x1), r1=14(y1), r2=44(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 14
LDI r2, 44
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
