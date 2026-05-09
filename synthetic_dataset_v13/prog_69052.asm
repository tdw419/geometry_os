; DESCRIPTION: Composite: Draws a red rectangle at (120, 68) with width 88 and height 106 then Places a black dot at position (364, 221) then Draws a black circle centered at (339, 129) with radius 30.
; PLAN: r0=120(x), r1=68(y), r2=88(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=364(x), r6=221(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=339(x), r11=129(y), r12=30(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 120
LDI r1, 68
LDI r2, 88
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 221
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 339
LDI r11, 129
LDI r12, 30
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
