; DESCRIPTION: Composite: Creates a purple rectangular region at (364, 113) spanning 60 by 117 pixels then Places a purple circle of radius 75 at center (148, 76) then Sets a single orange pixel at (288, 67).
; PLAN: r0=364(x), r1=113(y), r2=60(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=148(x), r6=76(y), r7=75(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=288(x), r11=67(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 364
LDI r1, 113
LDI r2, 60
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 76
LDI r7, 75
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 288
LDI r11, 67
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
