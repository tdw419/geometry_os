; DESCRIPTION: Composite: Draws a cyan rectangle at (293, 188) with width 61 and height 35 then Draws a white circle centered at (137, 175) with radius 72.
; PLAN: r0=293(x), r1=188(y), r2=61(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=137(x), r6=175(y), r7=72(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 293
LDI r1, 188
LDI r2, 61
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 175
LDI r7, 72
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
