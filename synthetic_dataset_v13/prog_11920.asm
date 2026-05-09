; DESCRIPTION: Composite: Draws a magenta rectangle at (424, 18) with width 46 and height 83 then Draws a yellow circle centered at (134, 117) with radius 76.
; PLAN: r0=424(x), r1=18(y), r2=46(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=134(x), r6=117(y), r7=76(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 424
LDI r1, 18
LDI r2, 46
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 134
LDI r6, 117
LDI r7, 76
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
