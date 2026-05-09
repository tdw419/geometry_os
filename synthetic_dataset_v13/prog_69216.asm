; DESCRIPTION: Composite: Creates a blue rectangular region at (54, 0) spanning 119 by 25 pixels then Creates a orange circular shape at (375, 208) with radius 23 then Sets a single cyan pixel at (31, 173).
; PLAN: r0=54(x), r1=0(y), r2=119(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=375(x), r6=208(y), r7=23(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=31(x), r11=173(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 54
LDI r1, 0
LDI r2, 119
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 375
LDI r6, 208
LDI r7, 23
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 31
LDI r11, 173
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
