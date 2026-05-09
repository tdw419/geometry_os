; DESCRIPTION: Composite: Renders a black disk with center (53, 191) and radius 38 then Draws a green rectangle at (173, 143) with width 34 and height 98.
; PLAN: r0=53(x), r1=191(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=173(x), r6=143(y), r7=34(width), r8=98(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 53
LDI r1, 191
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 173
LDI r6, 143
LDI r7, 34
LDI r8, 98
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
