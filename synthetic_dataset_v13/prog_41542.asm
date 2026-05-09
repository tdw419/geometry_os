; DESCRIPTION: Composite: Places a orange 116x91 rectangle at position (245, 55) then Places a orange dot at position (306, 68) then Draws a red circle centered at (227, 92) with radius 40.
; PLAN: r0=245(x), r1=55(y), r2=116(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=306(x), r6=68(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=227(x), r11=92(y), r12=40(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 245
LDI r1, 55
LDI r2, 116
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 68
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 227
LDI r11, 92
LDI r12, 40
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
