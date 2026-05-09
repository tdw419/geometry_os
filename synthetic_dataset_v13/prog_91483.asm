; DESCRIPTION: Composite: Draws a orange circle centered at (423, 135) with radius 29 then Sets a single blue pixel at (14, 123) then Draws a blue rectangle at (139, 121) with width 30 and height 108.
; PLAN: r0=423(x), r1=135(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=14(x), r6=123(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=139(x), r11=121(y), r12=30(width), r13=108(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 423
LDI r1, 135
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 14
LDI r6, 123
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 139
LDI r11, 121
LDI r12, 30
LDI r13, 108
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
