; DESCRIPTION: Composite: Draws a red rectangle at (359, 154) with width 71 and height 102 then Renders a black disk with center (255, 71) and radius 17.
; PLAN: r0=359(x), r1=154(y), r2=71(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=255(x), r6=71(y), r7=17(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 359
LDI r1, 154
LDI r2, 71
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 255
LDI r6, 71
LDI r7, 17
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
