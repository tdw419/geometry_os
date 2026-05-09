; DESCRIPTION: Composite: Draws a yellow circle centered at (211, 148) with radius 66 then Draws a red rectangle at (346, 28) with width 51 and height 65 then Places a green dot at position (224, 232).
; PLAN: r0=211(x), r1=148(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=346(x), r6=28(y), r7=51(width), r8=65(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=224(x), r11=232(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 211
LDI r1, 148
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 346
LDI r6, 28
LDI r7, 51
LDI r8, 65
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 224
LDI r11, 232
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
