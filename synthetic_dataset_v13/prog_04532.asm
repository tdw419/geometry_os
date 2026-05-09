; DESCRIPTION: Composite: Places a yellow dot at position (173, 123) then Creates a orange circular shape at (180, 155) with radius 54 then Creates a black rectangular region at (47, 20) spanning 79 by 21 pixels.
; PLAN: r0=173(x), r1=123(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=180(x), r6=155(y), r7=54(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=47(x), r11=20(y), r12=79(width), r13=21(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 173
LDI r1, 123
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 180
LDI r6, 155
LDI r7, 54
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 47
LDI r11, 20
LDI r12, 79
LDI r13, 21
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
