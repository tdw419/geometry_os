; DESCRIPTION: Composite: Draws a black rectangle at (12, 97) with width 19 and height 119 then Renders a magenta disk with center (364, 98) and radius 56.
; PLAN: r0=12(x), r1=97(y), r2=19(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=364(x), r6=98(y), r7=56(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 12
LDI r1, 97
LDI r2, 19
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 98
LDI r7, 56
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
