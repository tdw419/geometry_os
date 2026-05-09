; DESCRIPTION: Composite: Draws a magenta rectangle at (52, 4) with width 73 and height 40 then Draws a purple circle centered at (93, 165) with radius 74 then Sets a single cyan pixel at (217, 34).
; PLAN: r0=52(x), r1=4(y), r2=73(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=93(x), r6=165(y), r7=74(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=217(x), r11=34(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 52
LDI r1, 4
LDI r2, 73
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 165
LDI r7, 74
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 217
LDI r11, 34
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
