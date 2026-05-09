; DESCRIPTION: Composite: Places a blue dot at position (211, 17) then Renders a white disk with center (110, 55) and radius 15 then Creates a orange rectangular region at (376, 81) spanning 93 by 76 pixels.
; PLAN: r0=211(x), r1=17(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=110(x), r6=55(y), r7=15(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=376(x), r11=81(y), r12=93(width), r13=76(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 211
LDI r1, 17
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 110
LDI r6, 55
LDI r7, 15
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 376
LDI r11, 81
LDI r12, 93
LDI r13, 76
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
