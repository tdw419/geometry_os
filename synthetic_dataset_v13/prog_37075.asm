; DESCRIPTION: Composite: Draws a red circle centered at (316, 68) with radius 54 then Places a yellow dot at position (68, 52) then Draws a blue rectangle at (223, 73) with width 53 and height 65.
; PLAN: r0=316(x), r1=68(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=68(x), r6=52(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=223(x), r11=73(y), r12=53(width), r13=65(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 316
LDI r1, 68
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 68
LDI r6, 52
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 223
LDI r11, 73
LDI r12, 53
LDI r13, 65
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
