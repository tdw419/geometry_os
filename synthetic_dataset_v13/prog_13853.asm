; DESCRIPTION: Composite: Places a yellow circle of radius 77 at center (191, 97) then Places a orange dot at position (497, 253) then Creates a green rectangular region at (61, 60) spanning 77 by 96 pixels.
; PLAN: r0=191(x), r1=97(y), r2=77(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=497(x), r6=253(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=61(x), r11=60(y), r12=77(width), r13=96(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 191
LDI r1, 97
LDI r2, 77
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 497
LDI r6, 253
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 61
LDI r11, 60
LDI r12, 77
LDI r13, 96
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
