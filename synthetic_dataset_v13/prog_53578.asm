; DESCRIPTION: Composite: Draws a yellow rectangle at (276, 215) with width 69 and height 14 then Places a red dot at position (261, 76) then Places a yellow circle of radius 17 at center (342, 159).
; PLAN: r0=276(x), r1=215(y), r2=69(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=261(x), r6=76(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=342(x), r11=159(y), r12=17(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 276
LDI r1, 215
LDI r2, 69
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 76
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 342
LDI r11, 159
LDI r12, 17
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
