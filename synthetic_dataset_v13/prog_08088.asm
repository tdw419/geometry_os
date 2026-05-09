; DESCRIPTION: Composite: Renders a orange disk with center (304, 91) and radius 76 then Places a yellow dot at position (356, 62) then Draws a green rectangle at (21, 13) with width 57 and height 88.
; PLAN: r0=304(x), r1=91(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=356(x), r6=62(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=21(x), r11=13(y), r12=57(width), r13=88(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 304
LDI r1, 91
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 356
LDI r6, 62
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 21
LDI r11, 13
LDI r12, 57
LDI r13, 88
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
