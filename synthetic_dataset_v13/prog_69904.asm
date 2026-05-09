; DESCRIPTION: Composite: Draws a black circle centered at (342, 173) with radius 40 then Places a purple dot at position (312, 194) then Creates a orange rectangular region at (208, 55) spanning 54 by 18 pixels.
; PLAN: r0=342(x), r1=173(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=312(x), r6=194(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=208(x), r11=55(y), r12=54(width), r13=18(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 342
LDI r1, 173
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 312
LDI r6, 194
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 208
LDI r11, 55
LDI r12, 54
LDI r13, 18
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
