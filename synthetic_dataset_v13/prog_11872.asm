; DESCRIPTION: Composite: Draws a black rectangle at (130, 69) with width 48 and height 32 then Draws a white circle centered at (390, 189) with radius 24.
; PLAN: r0=130(x), r1=69(y), r2=48(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=390(x), r6=189(y), r7=24(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 130
LDI r1, 69
LDI r2, 48
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 189
LDI r7, 24
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
