; DESCRIPTION: Composite: Draws a cyan rectangle at (65, 135) with width 92 and height 78 then Sets a single magenta pixel at (316, 50) then Draws a magenta circle centered at (111, 141) with radius 25.
; PLAN: r0=65(x), r1=135(y), r2=92(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=316(x), r6=50(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=111(x), r11=141(y), r12=25(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 65
LDI r1, 135
LDI r2, 92
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 50
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 111
LDI r11, 141
LDI r12, 25
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
