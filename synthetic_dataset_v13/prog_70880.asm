; DESCRIPTION: Composite: Creates a blue rectangular region at (259, 101) spanning 72 by 36 pixels then Places a orange circle of radius 28 at center (155, 38) then Sets a single red pixel at (34, 164).
; PLAN: r0=259(x), r1=101(y), r2=72(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=155(x), r6=38(y), r7=28(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=34(x), r11=164(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 259
LDI r1, 101
LDI r2, 72
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 155
LDI r6, 38
LDI r7, 28
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 34
LDI r11, 164
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
