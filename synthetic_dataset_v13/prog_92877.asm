; DESCRIPTION: Composite: Renders a orange box of size 12x11 starting at (157, 82) then Sets a single magenta pixel at (245, 43) then Draws a black circle centered at (251, 238) with radius 11.
; PLAN: r0=157(x), r1=82(y), r2=12(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=245(x), r6=43(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=251(x), r11=238(y), r12=11(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 157
LDI r1, 82
LDI r2, 12
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 43
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 251
LDI r11, 238
LDI r12, 11
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
