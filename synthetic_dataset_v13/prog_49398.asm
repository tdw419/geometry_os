; DESCRIPTION: Composite: Draws a black rectangle at (416, 69) with width 96 and height 95 then Renders a white disk with center (96, 71) and radius 37 then Places a black dot at position (179, 57).
; PLAN: r0=416(x), r1=69(y), r2=96(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=96(x), r6=71(y), r7=37(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=179(x), r11=57(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 416
LDI r1, 69
LDI r2, 96
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 96
LDI r6, 71
LDI r7, 37
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 179
LDI r11, 57
LDI r12, 0x000000
PSET r10, r11, r12
HALT
