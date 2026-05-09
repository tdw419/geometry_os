; DESCRIPTION: Composite: Draws a magenta circle centered at (322, 90) with radius 75 then Draws a black rectangle at (111, 39) with width 26 and height 102.
; PLAN: r0=322(x), r1=90(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=111(x), r6=39(y), r7=26(width), r8=102(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 322
LDI r1, 90
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 111
LDI r6, 39
LDI r7, 26
LDI r8, 102
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
