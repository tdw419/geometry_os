; DESCRIPTION: Composite: Draws a black circle centered at (238, 196) with radius 46 then Draws a white rectangle at (185, 24) with width 86 and height 56.
; PLAN: r0=238(x), r1=196(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=185(x), r6=24(y), r7=86(width), r8=56(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 238
LDI r1, 196
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 185
LDI r6, 24
LDI r7, 86
LDI r8, 56
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
