; DESCRIPTION: Composite: Draws a red circle centered at (246, 60) with radius 22 then Draws a purple rectangle at (266, 138) with width 32 and height 78.
; PLAN: r0=246(x), r1=60(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=266(x), r6=138(y), r7=32(width), r8=78(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 246
LDI r1, 60
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 266
LDI r6, 138
LDI r7, 32
LDI r8, 78
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
