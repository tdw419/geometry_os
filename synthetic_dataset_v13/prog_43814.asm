; DESCRIPTION: Composite: Renders a black disk with center (330, 175) and radius 78 then Draws a blue rectangle at (387, 53) with width 16 and height 15.
; PLAN: r0=330(x), r1=175(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=387(x), r6=53(y), r7=16(width), r8=15(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 330
LDI r1, 175
LDI r2, 78
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 387
LDI r6, 53
LDI r7, 16
LDI r8, 15
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
