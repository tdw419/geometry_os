; DESCRIPTION: Composite: Draws a magenta rectangle at (32, 18) with width 40 and height 102 then Draws a blue circle centered at (19, 50) with radius 18.
; PLAN: r0=32(x), r1=18(y), r2=40(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=19(x), r6=50(y), r7=18(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 32
LDI r1, 18
LDI r2, 40
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 19
LDI r6, 50
LDI r7, 18
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
