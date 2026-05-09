; DESCRIPTION: Composite: Draws a black circle centered at (167, 198) with radius 56 then Draws a purple rectangle at (465, 176) with width 19 and height 60.
; PLAN: r0=167(x), r1=198(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=465(x), r6=176(y), r7=19(width), r8=60(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 167
LDI r1, 198
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 465
LDI r6, 176
LDI r7, 19
LDI r8, 60
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
