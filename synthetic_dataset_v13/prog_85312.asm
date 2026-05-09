; DESCRIPTION: Composite: Draws a purple circle centered at (276, 142) with radius 38 then Draws a yellow rectangle at (113, 29) with width 101 and height 113.
; PLAN: r0=276(x), r1=142(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=113(x), r6=29(y), r7=101(width), r8=113(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 276
LDI r1, 142
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 113
LDI r6, 29
LDI r7, 101
LDI r8, 113
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
