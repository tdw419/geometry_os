; DESCRIPTION: Composite: Draws a white rectangle at (155, 126) with width 49 and height 33 then Draws a blue circle centered at (298, 29) with radius 12 then Places a blue dot at position (446, 148).
; PLAN: r0=155(x), r1=126(y), r2=49(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=298(x), r6=29(y), r7=12(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=446(x), r11=148(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 155
LDI r1, 126
LDI r2, 49
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 29
LDI r7, 12
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 446
LDI r11, 148
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
