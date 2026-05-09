; DESCRIPTION: Composite: Draws a black rectangle at (415, 71) with width 12 and height 66 then Renders a green disk with center (369, 97) and radius 60 then Places a green dot at position (48, 135).
; PLAN: r0=415(x), r1=71(y), r2=12(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=369(x), r6=97(y), r7=60(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=48(x), r11=135(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 415
LDI r1, 71
LDI r2, 12
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 97
LDI r7, 60
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 48
LDI r11, 135
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
