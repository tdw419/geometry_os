; DESCRIPTION: Composite: Renders a black line between points (342, 232) and (68, 54) then Renders a magenta disk with center (136, 100) and radius 54.
; PLAN: r0=342(x1), r1=232(y1), r2=68(x2), r3=54(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=136(x), r6=100(y), r7=54(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 342
LDI r1, 232
LDI r2, 68
LDI r3, 54
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 136
LDI r6, 100
LDI r7, 54
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
