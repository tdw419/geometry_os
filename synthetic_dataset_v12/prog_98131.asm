; DESCRIPTION: Renders a yellow line between points (152, 232) and (435, 49).
; PLAN: r0=152(x1), r1=232(y1), r2=435(x2), r3=49(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 232
LDI r2, 435
LDI r3, 49
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
