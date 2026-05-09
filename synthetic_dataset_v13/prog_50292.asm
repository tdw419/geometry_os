; DESCRIPTION: Composite: Draws a red rectangle at (146, 166) with width 49 and height 35 then Renders a white disk with center (109, 87) and radius 66 then Places a red dot at position (155, 114).
; PLAN: r0=146(x), r1=166(y), r2=49(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=109(x), r6=87(y), r7=66(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=155(x), r11=114(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 146
LDI r1, 166
LDI r2, 49
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 87
LDI r7, 66
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 155
LDI r11, 114
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
