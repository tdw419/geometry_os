; DESCRIPTION: Composite: Draws a white circle centered at (448, 86) with radius 49 then Draws a black rectangle at (310, 86) with width 93 and height 49.
; PLAN: r0=448(x), r1=86(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=310(x), r6=86(y), r7=93(width), r8=49(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 448
LDI r1, 86
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 310
LDI r6, 86
LDI r7, 93
LDI r8, 49
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
