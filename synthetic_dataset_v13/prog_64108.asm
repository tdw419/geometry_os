; DESCRIPTION: Composite: Sets a single black pixel at (287, 117) then Draws a white circle centered at (261, 54) with radius 12 then Draws a yellow rectangle at (21, 179) with width 60 and height 45.
; PLAN: r0=287(x), r1=117(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=261(x), r6=54(y), r7=12(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=21(x), r11=179(y), r12=60(width), r13=45(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 287
LDI r1, 117
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 261
LDI r6, 54
LDI r7, 12
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 21
LDI r11, 179
LDI r12, 60
LDI r13, 45
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
