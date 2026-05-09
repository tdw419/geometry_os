; DESCRIPTION: Composite: Places a yellow dot at position (85, 53) then Places a blue circle of radius 27 at center (67, 158) then Creates a cyan rectangular region at (259, 11) spanning 49 by 11 pixels.
; PLAN: r0=85(x), r1=53(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=67(x), r6=158(y), r7=27(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=259(x), r11=11(y), r12=49(width), r13=11(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 85
LDI r1, 53
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 67
LDI r6, 158
LDI r7, 27
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 259
LDI r11, 11
LDI r12, 49
LDI r13, 11
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
