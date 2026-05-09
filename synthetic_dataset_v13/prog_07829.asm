; DESCRIPTION: Composite: Draws a blue rectangle at (144, 110) with width 39 and height 32 then Draws a black circle centered at (446, 119) with radius 64.
; PLAN: r0=144(x), r1=110(y), r2=39(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=446(x), r6=119(y), r7=64(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 144
LDI r1, 110
LDI r2, 39
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 119
LDI r7, 64
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
