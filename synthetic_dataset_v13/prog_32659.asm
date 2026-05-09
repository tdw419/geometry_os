; DESCRIPTION: Composite: Sets a single green pixel at (135, 67) then Creates a black circular shape at (196, 123) with radius 57 then Creates a cyan rectangular region at (26, 64) spanning 21 by 95 pixels.
; PLAN: r0=135(x), r1=67(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=196(x), r6=123(y), r7=57(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=26(x), r11=64(y), r12=21(width), r13=95(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 135
LDI r1, 67
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 196
LDI r6, 123
LDI r7, 57
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 26
LDI r11, 64
LDI r12, 21
LDI r13, 95
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
