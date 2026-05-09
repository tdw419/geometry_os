; DESCRIPTION: Composite: Creates a green circular shape at (183, 204) with radius 27 then Places a green dot at position (369, 109) then Creates a black rectangular region at (15, 31) spanning 15 by 16 pixels.
; PLAN: r0=183(x), r1=204(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=369(x), r6=109(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=15(x), r11=31(y), r12=15(width), r13=16(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 183
LDI r1, 204
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 369
LDI r6, 109
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 15
LDI r11, 31
LDI r12, 15
LDI r13, 16
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
