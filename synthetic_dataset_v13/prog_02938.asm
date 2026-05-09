; DESCRIPTION: Composite: Creates a white rectangular region at (264, 30) spanning 41 by 54 pixels then Draws a blue circle centered at (122, 82) with radius 52.
; PLAN: r0=264(x), r1=30(y), r2=41(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=122(x), r6=82(y), r7=52(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 264
LDI r1, 30
LDI r2, 41
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 82
LDI r7, 52
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
