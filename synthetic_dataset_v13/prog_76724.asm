; DESCRIPTION: Composite: Renders a orange disk with center (359, 189) and radius 66 then Places a red dot at position (421, 255) then Creates a black rectangular region at (202, 105) spanning 37 by 31 pixels.
; PLAN: r0=359(x), r1=189(y), r2=66(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=421(x), r6=255(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=202(x), r11=105(y), r12=37(width), r13=31(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 359
LDI r1, 189
LDI r2, 66
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 421
LDI r6, 255
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 202
LDI r11, 105
LDI r12, 37
LDI r13, 31
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
