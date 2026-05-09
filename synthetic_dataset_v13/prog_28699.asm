; DESCRIPTION: Composite: Sets a single green pixel at (147, 108) then Places a magenta circle of radius 13 at center (461, 90) then Draws a cyan rectangle at (311, 138) with width 69 and height 20.
; PLAN: r0=147(x), r1=108(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=461(x), r6=90(y), r7=13(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=311(x), r11=138(y), r12=69(width), r13=20(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 147
LDI r1, 108
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 461
LDI r6, 90
LDI r7, 13
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 311
LDI r11, 138
LDI r12, 69
LDI r13, 20
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
