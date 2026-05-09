; DESCRIPTION: Composite: Renders a blue disk with center (306, 115) and radius 73 then Places a green dot at position (474, 175) then Draws a magenta rectangle at (71, 142) with width 86 and height 67.
; PLAN: r0=306(x), r1=115(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=474(x), r6=175(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=71(x), r11=142(y), r12=86(width), r13=67(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 306
LDI r1, 115
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 474
LDI r6, 175
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 71
LDI r11, 142
LDI r12, 86
LDI r13, 67
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
