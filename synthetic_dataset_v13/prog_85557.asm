; DESCRIPTION: Composite: Draws a magenta rectangle at (274, 4) with width 114 and height 56 then Renders a magenta disk with center (411, 134) and radius 59 then Sets a single green pixel at (407, 195).
; PLAN: r0=274(x), r1=4(y), r2=114(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=411(x), r6=134(y), r7=59(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=407(x), r11=195(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 274
LDI r1, 4
LDI r2, 114
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 411
LDI r6, 134
LDI r7, 59
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 407
LDI r11, 195
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
