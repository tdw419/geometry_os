; DESCRIPTION: Composite: Sets a single magenta pixel at (59, 17) then Draws a white circle centered at (118, 143) with radius 37 then Draws a green rectangle at (362, 2) with width 83 and height 44.
; PLAN: r0=59(x), r1=17(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=118(x), r6=143(y), r7=37(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=362(x), r11=2(y), r12=83(width), r13=44(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 59
LDI r1, 17
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 118
LDI r6, 143
LDI r7, 37
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 362
LDI r11, 2
LDI r12, 83
LDI r13, 44
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
