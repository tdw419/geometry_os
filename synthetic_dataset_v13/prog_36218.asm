; DESCRIPTION: Composite: Creates a white rectangular region at (226, 162) spanning 117 by 16 pixels then Renders a black disk with center (314, 78) and radius 33.
; PLAN: r0=226(x), r1=162(y), r2=117(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=314(x), r6=78(y), r7=33(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 226
LDI r1, 162
LDI r2, 117
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 78
LDI r7, 33
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
