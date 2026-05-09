; DESCRIPTION: Composite: Sets a single green pixel at (484, 129) then Creates a white rectangular region at (262, 98) spanning 114 by 112 pixels then Renders a white disk with center (265, 65) and radius 29.
; PLAN: r0=484(x), r1=129(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=262(x), r6=98(y), r7=114(width), r8=112(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=265(x), r11=65(y), r12=29(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 484
LDI r1, 129
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 262
LDI r6, 98
LDI r7, 114
LDI r8, 112
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 265
LDI r11, 65
LDI r12, 29
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
