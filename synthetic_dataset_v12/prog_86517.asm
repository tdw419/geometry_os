; DESCRIPTION: Composite: Creates a white rectangular region at (43, 165) spanning 17 by 84 pixels then Renders a orange disk with center (93, 146) and radius 14.
; PLAN: r0=43(x), r1=165(y), r2=17(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=93(x), r6=146(y), r7=14(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 43
LDI r1, 165
LDI r2, 17
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 146
LDI r7, 14
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
