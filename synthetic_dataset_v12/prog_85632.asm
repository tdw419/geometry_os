; DESCRIPTION: Renders a blue line between points (435, 26) and (152, 211).
; PLAN: r0=435(x1), r1=26(y1), r2=152(x2), r3=211(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 26
LDI r2, 152
LDI r3, 211
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
