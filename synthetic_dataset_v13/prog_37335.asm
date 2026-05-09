; DESCRIPTION: Composite: Renders a yellow box of size 63x119 starting at (151, 11) then Places a magenta circle of radius 69 at center (375, 156).
; PLAN: r0=151(x), r1=11(y), r2=63(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=375(x), r6=156(y), r7=69(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 151
LDI r1, 11
LDI r2, 63
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 375
LDI r6, 156
LDI r7, 69
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
