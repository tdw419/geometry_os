; DESCRIPTION: Composite: Sets a single white pixel at (216, 209) then Draws a white circle centered at (156, 107) with radius 66 then Draws a blue rectangle at (217, 56) with width 115 and height 28.
; PLAN: r0=216(x), r1=209(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=156(x), r6=107(y), r7=66(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=217(x), r11=56(y), r12=115(width), r13=28(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 216
LDI r1, 209
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 156
LDI r6, 107
LDI r7, 66
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 217
LDI r11, 56
LDI r12, 115
LDI r13, 28
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
