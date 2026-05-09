; DESCRIPTION: Composite: Creates a yellow circular shape at (58, 134) with radius 30 then Places a red dot at position (240, 38) then Draws a white rectangle at (5, 190) with width 105 and height 55.
; PLAN: r0=58(x), r1=134(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=240(x), r6=38(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=5(x), r11=190(y), r12=105(width), r13=55(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 58
LDI r1, 134
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 240
LDI r6, 38
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 5
LDI r11, 190
LDI r12, 105
LDI r13, 55
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
