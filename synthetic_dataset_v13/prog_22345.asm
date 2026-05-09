; DESCRIPTION: Composite: Draws a yellow circle centered at (435, 153) with radius 39 then Draws a red rectangle at (190, 199) with width 95 and height 21 then Sets a single blue pixel at (121, 158).
; PLAN: r0=435(x), r1=153(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=190(x), r6=199(y), r7=95(width), r8=21(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=121(x), r11=158(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 435
LDI r1, 153
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 190
LDI r6, 199
LDI r7, 95
LDI r8, 21
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 121
LDI r11, 158
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
