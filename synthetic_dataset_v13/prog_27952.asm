; DESCRIPTION: Composite: Sets a single black pixel at (344, 83) then Places a yellow circle of radius 72 at center (165, 131) then Draws a blue rectangle at (314, 16) with width 93 and height 110.
; PLAN: r0=344(x), r1=83(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=165(x), r6=131(y), r7=72(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=314(x), r11=16(y), r12=93(width), r13=110(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 344
LDI r1, 83
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 165
LDI r6, 131
LDI r7, 72
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 314
LDI r11, 16
LDI r12, 93
LDI r13, 110
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
