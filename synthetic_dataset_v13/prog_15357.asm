; DESCRIPTION: Composite: Draws a magenta circle centered at (344, 141) with radius 77 then Draws a green rectangle at (279, 122) with width 108 and height 119.
; PLAN: r0=344(x), r1=141(y), r2=77(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=279(x), r6=122(y), r7=108(width), r8=119(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 344
LDI r1, 141
LDI r2, 77
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 279
LDI r6, 122
LDI r7, 108
LDI r8, 119
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
