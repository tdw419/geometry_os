; DESCRIPTION: Composite: Creates a green rectangular region at (342, 143) spanning 59 by 30 pixels then Renders a black disk with center (438, 78) and radius 71.
; PLAN: r0=342(x), r1=143(y), r2=59(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=438(x), r6=78(y), r7=71(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 342
LDI r1, 143
LDI r2, 59
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 78
LDI r7, 71
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
