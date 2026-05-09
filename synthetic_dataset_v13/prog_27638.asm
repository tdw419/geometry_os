; DESCRIPTION: Composite: Renders a yellow box of size 12x62 starting at (349, 40) then Creates a yellow circular shape at (316, 125) with radius 77.
; PLAN: r0=349(x), r1=40(y), r2=12(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=316(x), r6=125(y), r7=77(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 349
LDI r1, 40
LDI r2, 12
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 125
LDI r7, 77
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
