; DESCRIPTION: Composite: Places a magenta dot at position (418, 49) then Draws a black rectangle at (239, 71) with width 108 and height 48 then Draws a red circle centered at (192, 79) with radius 74.
; PLAN: r0=418(x), r1=49(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=239(x), r6=71(y), r7=108(width), r8=48(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=192(x), r11=79(y), r12=74(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 418
LDI r1, 49
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 239
LDI r6, 71
LDI r7, 108
LDI r8, 48
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 192
LDI r11, 79
LDI r12, 74
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
