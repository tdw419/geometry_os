; DESCRIPTION: Composite: Draws a red rectangle at (50, 55) with width 74 and height 15 then Places a magenta circle of radius 58 at center (175, 176).
; PLAN: r0=50(x), r1=55(y), r2=74(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=175(x), r6=176(y), r7=58(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 50
LDI r1, 55
LDI r2, 74
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 176
LDI r7, 58
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
