; DESCRIPTION: Composite: Creates a white circular shape at (273, 115) with radius 78 then Draws a yellow rectangle at (98, 113) with width 91 and height 82 then Sets a single black pixel at (243, 181).
; PLAN: r0=273(x), r1=115(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=98(x), r6=113(y), r7=91(width), r8=82(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=243(x), r11=181(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 273
LDI r1, 115
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 98
LDI r6, 113
LDI r7, 91
LDI r8, 82
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 243
LDI r11, 181
LDI r12, 0x000000
PSET r10, r11, r12
HALT
