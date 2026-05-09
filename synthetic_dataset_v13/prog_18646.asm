; DESCRIPTION: Composite: Draws a green rectangle at (29, 71) with width 50 and height 57 then Renders a magenta disk with center (266, 77) and radius 60 then Places a black dot at position (306, 28).
; PLAN: r0=29(x), r1=71(y), r2=50(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=266(x), r6=77(y), r7=60(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=306(x), r11=28(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 29
LDI r1, 71
LDI r2, 50
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 77
LDI r7, 60
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 306
LDI r11, 28
LDI r12, 0x000000
PSET r10, r11, r12
HALT
