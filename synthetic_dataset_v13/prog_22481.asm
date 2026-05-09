; DESCRIPTION: Renders a yellow line between points (435, 243) and (364, 48).
; PLAN: r0=435(x1), r1=243(y1), r2=364(x2), r3=48(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 243
LDI r2, 364
LDI r3, 48
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
