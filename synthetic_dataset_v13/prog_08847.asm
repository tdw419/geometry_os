; DESCRIPTION: Composite: Creates a orange circular shape at (489, 198) with radius 22 then Sets a single purple pixel at (104, 100) then Creates a orange rectangular region at (130, 108) spanning 61 by 102 pixels.
; PLAN: r0=489(x), r1=198(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=104(x), r6=100(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=130(x), r11=108(y), r12=61(width), r13=102(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 489
LDI r1, 198
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 104
LDI r6, 100
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 130
LDI r11, 108
LDI r12, 61
LDI r13, 102
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
