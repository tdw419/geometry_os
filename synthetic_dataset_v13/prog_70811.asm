; DESCRIPTION: Composite: Renders a blue disk with center (338, 165) and radius 47 then Draws a cyan rectangle at (170, 140) with width 90 and height 115 then Sets a single orange pixel at (239, 69).
; PLAN: r0=338(x), r1=165(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=170(x), r6=140(y), r7=90(width), r8=115(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=239(x), r11=69(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 338
LDI r1, 165
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 170
LDI r6, 140
LDI r7, 90
LDI r8, 115
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 239
LDI r11, 69
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
