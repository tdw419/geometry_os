; DESCRIPTION: Composite: Draws a cyan circle centered at (329, 158) with radius 53 then Sets a single green pixel at (236, 173) then Creates a black rectangular region at (59, 142) spanning 114 by 72 pixels.
; PLAN: r0=329(x), r1=158(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=236(x), r6=173(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=59(x), r11=142(y), r12=114(width), r13=72(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 329
LDI r1, 158
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 236
LDI r6, 173
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 59
LDI r11, 142
LDI r12, 114
LDI r13, 72
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
