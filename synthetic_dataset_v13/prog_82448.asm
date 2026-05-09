; DESCRIPTION: Composite: Sets a single white pixel at (0, 138) then Places a green circle of radius 42 at center (146, 125) then Draws a purple rectangle at (58, 61) with width 17 and height 17.
; PLAN: r0=0(x), r1=138(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=146(x), r6=125(y), r7=42(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=58(x), r11=61(y), r12=17(width), r13=17(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 0
LDI r1, 138
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 146
LDI r6, 125
LDI r7, 42
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 58
LDI r11, 61
LDI r12, 17
LDI r13, 17
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
