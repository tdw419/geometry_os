; DESCRIPTION: Composite: Draws a green rectangle at (198, 57) with width 116 and height 15 then Places a white circle of radius 72 at center (270, 105).
; PLAN: r0=198(x), r1=57(y), r2=116(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=270(x), r6=105(y), r7=72(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 198
LDI r1, 57
LDI r2, 116
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 105
LDI r7, 72
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
