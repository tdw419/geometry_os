; DESCRIPTION: Composite: Draws a yellow rectangle at (195, 118) with width 69 and height 61 then Draws a yellow circle centered at (266, 166) with radius 67.
; PLAN: r0=195(x), r1=118(y), r2=69(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=266(x), r6=166(y), r7=67(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 195
LDI r1, 118
LDI r2, 69
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 166
LDI r7, 67
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
