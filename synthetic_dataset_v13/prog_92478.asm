; DESCRIPTION: Composite: Draws a black rectangle at (394, 167) with width 23 and height 60 then Renders a cyan disk with center (166, 105) and radius 75 then Places a black dot at position (224, 129).
; PLAN: r0=394(x), r1=167(y), r2=23(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=166(x), r6=105(y), r7=75(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=224(x), r11=129(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 394
LDI r1, 167
LDI r2, 23
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 166
LDI r6, 105
LDI r7, 75
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 224
LDI r11, 129
LDI r12, 0x000000
PSET r10, r11, r12
HALT
