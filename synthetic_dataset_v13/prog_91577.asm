; DESCRIPTION: Composite: Draws a blue rectangle at (375, 1) with width 32 and height 35 then Renders a magenta disk with center (145, 112) and radius 55 then Sets a single black pixel at (376, 29).
; PLAN: r0=375(x), r1=1(y), r2=32(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=145(x), r6=112(y), r7=55(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=376(x), r11=29(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 375
LDI r1, 1
LDI r2, 32
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 112
LDI r7, 55
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 376
LDI r11, 29
LDI r12, 0x000000
PSET r10, r11, r12
HALT
