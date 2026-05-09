; DESCRIPTION: Composite: Creates a black circular shape at (197, 105) with radius 17 then Creates a black rectangular region at (366, 17) spanning 103 by 52 pixels.
; PLAN: r0=197(x), r1=105(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=366(x), r6=17(y), r7=103(width), r8=52(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 197
LDI r1, 105
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 366
LDI r6, 17
LDI r7, 103
LDI r8, 52
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
