; DESCRIPTION: Composite: Renders a yellow line between points (76, 35) and (278, 233) then Creates a black circular shape at (313, 130) with radius 77.
; PLAN: r0=76(x1), r1=35(y1), r2=278(x2), r3=233(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=313(x), r6=130(y), r7=77(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 76
LDI r1, 35
LDI r2, 278
LDI r3, 233
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 130
LDI r7, 77
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
