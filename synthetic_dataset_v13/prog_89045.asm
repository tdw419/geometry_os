; DESCRIPTION: Composite: Sets a single black pixel at (65, 136) then Creates a green rectangular region at (442, 134) spanning 52 by 116 pixels then Renders a cyan disk with center (272, 98) and radius 62.
; PLAN: r0=65(x), r1=136(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=442(x), r6=134(y), r7=52(width), r8=116(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=272(x), r11=98(y), r12=62(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 65
LDI r1, 136
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 442
LDI r6, 134
LDI r7, 52
LDI r8, 116
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 272
LDI r11, 98
LDI r12, 62
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
