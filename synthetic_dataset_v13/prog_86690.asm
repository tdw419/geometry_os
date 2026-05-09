; DESCRIPTION: Composite: Places a white circle of radius 78 at center (388, 104) then Places a yellow dot at position (344, 74) then Draws a cyan rectangle at (407, 135) with width 42 and height 42.
; PLAN: r0=388(x), r1=104(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=344(x), r6=74(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=407(x), r11=135(y), r12=42(width), r13=42(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 388
LDI r1, 104
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 344
LDI r6, 74
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 407
LDI r11, 135
LDI r12, 42
LDI r13, 42
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
