; DESCRIPTION: Composite: Draws a red circle centered at (189, 143) with radius 78 then Draws a magenta rectangle at (170, 65) with width 76 and height 109 then Sets a single magenta pixel at (176, 29).
; PLAN: r0=189(x), r1=143(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=170(x), r6=65(y), r7=76(width), r8=109(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=176(x), r11=29(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 189
LDI r1, 143
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 170
LDI r6, 65
LDI r7, 76
LDI r8, 109
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 176
LDI r11, 29
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
