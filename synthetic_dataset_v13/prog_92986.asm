; DESCRIPTION: Renders a yellow line between points (88, 17) and (165, 48).
; PLAN: r0=88(x1), r1=17(y1), r2=165(x2), r3=48(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 17
LDI r2, 165
LDI r3, 48
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
