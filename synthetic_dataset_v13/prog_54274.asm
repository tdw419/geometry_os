; DESCRIPTION: Composite: Sets a single purple pixel at (430, 31) then Places a orange circle of radius 21 at center (184, 74) then Creates a red rectangular region at (394, 85) spanning 33 by 58 pixels.
; PLAN: r0=430(x), r1=31(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=184(x), r6=74(y), r7=21(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=394(x), r11=85(y), r12=33(width), r13=58(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 430
LDI r1, 31
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 184
LDI r6, 74
LDI r7, 21
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 394
LDI r11, 85
LDI r12, 33
LDI r13, 58
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
