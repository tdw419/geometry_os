; DESCRIPTION: Composite: Renders a black line between points (17, 56) and (300, 183) then Creates a yellow circular shape at (413, 137) with radius 10.
; PLAN: r0=17(x1), r1=56(y1), r2=300(x2), r3=183(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=413(x), r6=137(y), r7=10(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 17
LDI r1, 56
LDI r2, 300
LDI r3, 183
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 137
LDI r7, 10
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
