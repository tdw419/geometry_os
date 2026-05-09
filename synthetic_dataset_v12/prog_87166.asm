; DESCRIPTION: Composite: Renders a purple line between points (211, 17) and (315, 79) then Renders a black disk with center (122, 138) and radius 59.
; PLAN: r0=211(x1), r1=17(y1), r2=315(x2), r3=79(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=122(x), r6=138(y), r7=59(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 211
LDI r1, 17
LDI r2, 315
LDI r3, 79
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 138
LDI r7, 59
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
