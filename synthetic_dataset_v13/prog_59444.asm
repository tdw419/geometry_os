; DESCRIPTION: Composite: Draws a white circle centered at (426, 61) with radius 61 then Draws a red rectangle at (44, 164) with width 76 and height 71 then Sets a single magenta pixel at (411, 248).
; PLAN: r0=426(x), r1=61(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=44(x), r6=164(y), r7=76(width), r8=71(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=411(x), r11=248(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 426
LDI r1, 61
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 44
LDI r6, 164
LDI r7, 76
LDI r8, 71
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 411
LDI r11, 248
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
