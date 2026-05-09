; DESCRIPTION: Composite: Sets a single orange pixel at (288, 76) then Places a white circle of radius 20 at center (383, 122) then Creates a orange rectangular region at (246, 99) spanning 86 by 82 pixels.
; PLAN: r0=288(x), r1=76(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=383(x), r6=122(y), r7=20(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=246(x), r11=99(y), r12=86(width), r13=82(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 288
LDI r1, 76
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 383
LDI r6, 122
LDI r7, 20
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 246
LDI r11, 99
LDI r12, 86
LDI r13, 82
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
