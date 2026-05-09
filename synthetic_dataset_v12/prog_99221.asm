; DESCRIPTION: Composite: Sets a single white pixel at (244, 165) then Renders a blue disk with center (223, 86) and radius 37 then Draws a white rectangle at (101, 7) with width 100 and height 107.
; PLAN: r0=244(x), r1=165(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=223(x), r6=86(y), r7=37(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=101(x), r11=7(y), r12=100(width), r13=107(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 244
LDI r1, 165
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 223
LDI r6, 86
LDI r7, 37
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 101
LDI r11, 7
LDI r12, 100
LDI r13, 107
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
