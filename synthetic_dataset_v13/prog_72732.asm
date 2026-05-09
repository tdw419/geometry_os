; DESCRIPTION: Composite: Draws a yellow circle centered at (376, 190) with radius 43 then Draws a white rectangle at (357, 94) with width 48 and height 113 then Sets a single black pixel at (248, 70).
; PLAN: r0=376(x), r1=190(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=357(x), r6=94(y), r7=48(width), r8=113(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=248(x), r11=70(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 376
LDI r1, 190
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 357
LDI r6, 94
LDI r7, 48
LDI r8, 113
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 248
LDI r11, 70
LDI r12, 0x000000
PSET r10, r11, r12
HALT
