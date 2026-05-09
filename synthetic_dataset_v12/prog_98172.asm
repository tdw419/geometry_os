; DESCRIPTION: Composite: Draws a green rectangle at (69, 183) with width 18 and height 39 then Places a red circle of radius 72 at center (111, 149).
; PLAN: r0=69(x), r1=183(y), r2=18(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=111(x), r6=149(y), r7=72(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 69
LDI r1, 183
LDI r2, 18
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 111
LDI r6, 149
LDI r7, 72
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
