; DESCRIPTION: Composite: Draws a yellow rectangle at (315, 189) with width 71 and height 52 then Sets a single yellow pixel at (223, 43) then Renders a black disk with center (238, 67) and radius 66.
; PLAN: r0=315(x), r1=189(y), r2=71(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=223(x), r6=43(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=238(x), r11=67(y), r12=66(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 315
LDI r1, 189
LDI r2, 71
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 223
LDI r6, 43
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 238
LDI r11, 67
LDI r12, 66
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
