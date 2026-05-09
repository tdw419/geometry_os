; DESCRIPTION: Composite: Draws a green rectangle at (12, 159) with width 69 and height 16 then Renders a cyan disk with center (436, 115) and radius 38 then Places a green dot at position (49, 53).
; PLAN: r0=12(x), r1=159(y), r2=69(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=436(x), r6=115(y), r7=38(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=49(x), r11=53(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 12
LDI r1, 159
LDI r2, 69
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 115
LDI r7, 38
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 49
LDI r11, 53
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
