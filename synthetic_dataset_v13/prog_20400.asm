; DESCRIPTION: Renders a yellow line between points (422, 175) and (114, 216).
; PLAN: r0=422(x1), r1=175(y1), r2=114(x2), r3=216(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 175
LDI r2, 114
LDI r3, 216
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
