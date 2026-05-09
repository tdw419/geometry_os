; DESCRIPTION: Composite: Creates a orange circular shape at (236, 178) with radius 18 then Sets a single black pixel at (375, 14) then Draws a green rectangle at (397, 133) with width 53 and height 36.
; PLAN: r0=236(x), r1=178(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=375(x), r6=14(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=397(x), r11=133(y), r12=53(width), r13=36(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 236
LDI r1, 178
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 375
LDI r6, 14
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 397
LDI r11, 133
LDI r12, 53
LDI r13, 36
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
