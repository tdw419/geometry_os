; DESCRIPTION: Composite: Draws a white circle centered at (421, 116) with radius 53 then Places a orange dot at position (216, 38) then Draws a blue rectangle at (13, 138) with width 82 and height 42.
; PLAN: r0=421(x), r1=116(y), r2=53(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=216(x), r6=38(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=13(x), r11=138(y), r12=82(width), r13=42(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 421
LDI r1, 116
LDI r2, 53
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 216
LDI r6, 38
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 13
LDI r11, 138
LDI r12, 82
LDI r13, 42
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
