; DESCRIPTION: Composite: Draws a magenta rectangle at (4, 146) with width 69 and height 66 then Places a purple circle of radius 24 at center (116, 127).
; PLAN: r0=4(x), r1=146(y), r2=69(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=116(x), r6=127(y), r7=24(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 4
LDI r1, 146
LDI r2, 69
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 127
LDI r7, 24
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
