; DESCRIPTION: Composite: Renders a yellow box of size 55x93 starting at (47, 56) then Creates a yellow circular shape at (325, 95) with radius 73.
; PLAN: r0=47(x), r1=56(y), r2=55(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=325(x), r6=95(y), r7=73(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 47
LDI r1, 56
LDI r2, 55
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 325
LDI r6, 95
LDI r7, 73
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
