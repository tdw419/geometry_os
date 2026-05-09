; DESCRIPTION: Composite: Places a black dot at position (155, 77) then Creates a yellow circular shape at (170, 73) with radius 67 then Creates a black rectangular region at (304, 178) spanning 111 by 55 pixels.
; PLAN: r0=155(x), r1=77(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=170(x), r6=73(y), r7=67(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=304(x), r11=178(y), r12=111(width), r13=55(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 155
LDI r1, 77
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 170
LDI r6, 73
LDI r7, 67
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 304
LDI r11, 178
LDI r12, 111
LDI r13, 55
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
