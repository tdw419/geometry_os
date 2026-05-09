; DESCRIPTION: Composite: Draws a white rectangle at (171, 120) with width 76 and height 32 then Creates a yellow circular shape at (432, 84) with radius 73.
; PLAN: r0=171(x), r1=120(y), r2=76(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=432(x), r6=84(y), r7=73(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 171
LDI r1, 120
LDI r2, 76
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 84
LDI r7, 73
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
