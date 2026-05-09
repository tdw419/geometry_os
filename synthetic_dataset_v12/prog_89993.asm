; DESCRIPTION: Composite: Places a white circle of radius 69 at center (397, 74) then Sets a single black pixel at (256, 63) then Creates a white rectangular region at (286, 73) spanning 58 by 55 pixels.
; PLAN: r0=397(x), r1=74(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=256(x), r6=63(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=286(x), r11=73(y), r12=58(width), r13=55(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 397
LDI r1, 74
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 256
LDI r6, 63
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 286
LDI r11, 73
LDI r12, 58
LDI r13, 55
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
