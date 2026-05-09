; DESCRIPTION: Composite: Places a orange dot at position (211, 197) then Draws a black circle centered at (327, 143) with radius 72 then Creates a black rectangular region at (213, 138) spanning 101 by 110 pixels.
; PLAN: r0=211(x), r1=197(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=327(x), r6=143(y), r7=72(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=213(x), r11=138(y), r12=101(width), r13=110(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 211
LDI r1, 197
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 327
LDI r6, 143
LDI r7, 72
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 213
LDI r11, 138
LDI r12, 101
LDI r13, 110
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
