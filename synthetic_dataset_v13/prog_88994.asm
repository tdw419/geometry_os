; DESCRIPTION: Composite: Creates a white rectangular region at (287, 124) spanning 70 by 31 pixels then Draws a red circle centered at (53, 24) with radius 18 then Places a green dot at position (219, 147).
; PLAN: r0=287(x), r1=124(y), r2=70(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=53(x), r6=24(y), r7=18(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=219(x), r11=147(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 287
LDI r1, 124
LDI r2, 70
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 53
LDI r6, 24
LDI r7, 18
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 219
LDI r11, 147
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
