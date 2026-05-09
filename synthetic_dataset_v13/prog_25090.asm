; DESCRIPTION: Composite: Sets a single black pixel at (230, 155) then Draws a green rectangle at (65, 44) with width 28 and height 111 then Renders a white disk with center (430, 124) and radius 48.
; PLAN: r0=230(x), r1=155(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=65(x), r6=44(y), r7=28(width), r8=111(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=430(x), r11=124(y), r12=48(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 230
LDI r1, 155
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 65
LDI r6, 44
LDI r7, 28
LDI r8, 111
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 430
LDI r11, 124
LDI r12, 48
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
