; DESCRIPTION: Composite: Places a purple dot at position (28, 20) then Draws a magenta circle centered at (137, 158) with radius 19 then Places a blue 37x73 rectangle at position (314, 172).
; PLAN: r0=28(x), r1=20(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=137(x), r6=158(y), r7=19(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=314(x), r11=172(y), r12=37(width), r13=73(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 28
LDI r1, 20
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 137
LDI r6, 158
LDI r7, 19
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 314
LDI r11, 172
LDI r12, 37
LDI r13, 73
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
