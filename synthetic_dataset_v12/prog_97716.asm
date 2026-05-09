; DESCRIPTION: Renders a yellow line between points (288, 26) and (341, 217).
; PLAN: r0=288(x1), r1=26(y1), r2=341(x2), r3=217(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 26
LDI r2, 341
LDI r3, 217
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
