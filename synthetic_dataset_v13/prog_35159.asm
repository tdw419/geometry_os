; DESCRIPTION: Composite: Creates a orange circular shape at (50, 89) with radius 15 then Places a yellow dot at position (414, 84) then Renders a yellow box of size 116x55 starting at (272, 39).
; PLAN: r0=50(x), r1=89(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=414(x), r6=84(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=272(x), r11=39(y), r12=116(width), r13=55(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 50
LDI r1, 89
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 414
LDI r6, 84
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 272
LDI r11, 39
LDI r12, 116
LDI r13, 55
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
