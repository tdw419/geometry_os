; DESCRIPTION: Composite: Creates a black rectangular region at (291, 134) spanning 96 by 87 pixels then Places a magenta dot at position (430, 101) then Creates a red circular shape at (173, 181) with radius 72.
; PLAN: r0=291(x), r1=134(y), r2=96(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=430(x), r6=101(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=173(x), r11=181(y), r12=72(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 291
LDI r1, 134
LDI r2, 96
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 101
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 173
LDI r11, 181
LDI r12, 72
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
