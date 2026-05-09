; DESCRIPTION: Renders a yellow line between points (83, 175) and (253, 121).
; PLAN: r0=83(x1), r1=175(y1), r2=253(x2), r3=121(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 175
LDI r2, 253
LDI r3, 121
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
