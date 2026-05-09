; DESCRIPTION: Composite: Renders a orange disk with center (412, 157) and radius 63 then Places a white dot at position (427, 241) then Creates a black rectangular region at (295, 21) spanning 54 by 97 pixels.
; PLAN: r0=412(x), r1=157(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=427(x), r6=241(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=295(x), r11=21(y), r12=54(width), r13=97(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 412
LDI r1, 157
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 427
LDI r6, 241
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 295
LDI r11, 21
LDI r12, 54
LDI r13, 97
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
