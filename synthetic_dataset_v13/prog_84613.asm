; DESCRIPTION: Composite: Draws a red rectangle at (339, 184) with width 47 and height 65 then Places a green circle of radius 74 at center (397, 181).
; PLAN: r0=339(x), r1=184(y), r2=47(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=397(x), r6=181(y), r7=74(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 339
LDI r1, 184
LDI r2, 47
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 397
LDI r6, 181
LDI r7, 74
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
