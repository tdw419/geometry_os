; DESCRIPTION: Composite: Places a orange dot at position (375, 254) then Places a red circle of radius 37 at center (184, 147) then Creates a orange rectangular region at (138, 116) spanning 104 by 59 pixels.
; PLAN: r0=375(x), r1=254(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=184(x), r6=147(y), r7=37(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=138(x), r11=116(y), r12=104(width), r13=59(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 375
LDI r1, 254
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 184
LDI r6, 147
LDI r7, 37
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 138
LDI r11, 116
LDI r12, 104
LDI r13, 59
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
