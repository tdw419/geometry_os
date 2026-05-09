; DESCRIPTION: Composite: Sets a single purple pixel at (234, 126) then Renders a cyan disk with center (136, 134) and radius 69 then Draws a blue rectangle at (82, 13) with width 78 and height 30.
; PLAN: r0=234(x), r1=126(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=136(x), r6=134(y), r7=69(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=82(x), r11=13(y), r12=78(width), r13=30(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 234
LDI r1, 126
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 136
LDI r6, 134
LDI r7, 69
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 82
LDI r11, 13
LDI r12, 78
LDI r13, 30
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
