; DESCRIPTION: Composite: Renders a purple box of size 108x82 starting at (40, 96) then Draws a magenta circle centered at (137, 119) with radius 73.
; PLAN: r0=40(x), r1=96(y), r2=108(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=137(x), r6=119(y), r7=73(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 40
LDI r1, 96
LDI r2, 108
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 119
LDI r7, 73
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
