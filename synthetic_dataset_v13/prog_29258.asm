; DESCRIPTION: Composite: Draws a cyan circle centered at (245, 84) with radius 39 then Places a green dot at position (148, 189) then Places a orange 103x29 rectangle at position (355, 211).
; PLAN: r0=245(x), r1=84(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=148(x), r6=189(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=355(x), r11=211(y), r12=103(width), r13=29(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 245
LDI r1, 84
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 148
LDI r6, 189
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 355
LDI r11, 211
LDI r12, 103
LDI r13, 29
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
