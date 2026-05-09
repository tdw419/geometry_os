; DESCRIPTION: Composite: Places a cyan dot at position (478, 63) then Places a red circle of radius 20 at center (127, 197) then Creates a black rectangular region at (174, 203) spanning 118 by 53 pixels.
; PLAN: r0=478(x), r1=63(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=127(x), r6=197(y), r7=20(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=174(x), r11=203(y), r12=118(width), r13=53(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 478
LDI r1, 63
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 127
LDI r6, 197
LDI r7, 20
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 174
LDI r11, 203
LDI r12, 118
LDI r13, 53
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
