; DESCRIPTION: Composite: Draws a white rectangle at (219, 18) with width 60 and height 39 then Creates a cyan circular shape at (431, 156) with radius 28.
; PLAN: r0=219(x), r1=18(y), r2=60(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=431(x), r6=156(y), r7=28(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 219
LDI r1, 18
LDI r2, 60
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 431
LDI r6, 156
LDI r7, 28
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
