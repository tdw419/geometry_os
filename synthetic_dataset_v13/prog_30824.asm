; DESCRIPTION: Composite: Places a orange dot at position (78, 31) then Creates a blue circular shape at (81, 171) with radius 69 then Creates a blue rectangular region at (304, 46) spanning 103 by 75 pixels.
; PLAN: r0=78(x), r1=31(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=81(x), r6=171(y), r7=69(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=304(x), r11=46(y), r12=103(width), r13=75(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 78
LDI r1, 31
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 81
LDI r6, 171
LDI r7, 69
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 304
LDI r11, 46
LDI r12, 103
LDI r13, 75
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
