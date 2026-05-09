; DESCRIPTION: Composite: Sets a single purple pixel at (383, 175) then Places a orange circle of radius 31 at center (45, 129) then Creates a red rectangular region at (273, 51) spanning 116 by 67 pixels.
; PLAN: r0=383(x), r1=175(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=45(x), r6=129(y), r7=31(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=273(x), r11=51(y), r12=116(width), r13=67(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 383
LDI r1, 175
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 45
LDI r6, 129
LDI r7, 31
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 273
LDI r11, 51
LDI r12, 116
LDI r13, 67
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
