; DESCRIPTION: Composite: Sets a single purple pixel at (121, 94) then Draws a cyan circle centered at (272, 203) with radius 14 then Creates a cyan rectangular region at (32, 160) spanning 52 by 24 pixels.
; PLAN: r0=121(x), r1=94(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=272(x), r6=203(y), r7=14(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=32(x), r11=160(y), r12=52(width), r13=24(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 121
LDI r1, 94
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 272
LDI r6, 203
LDI r7, 14
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 32
LDI r11, 160
LDI r12, 52
LDI r13, 24
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
