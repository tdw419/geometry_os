; DESCRIPTION: Composite: Creates a purple circular shape at (87, 172) with radius 10 then Creates a red rectangular region at (414, 85) spanning 64 by 19 pixels then Sets a single orange pixel at (329, 206).
; PLAN: r0=87(x), r1=172(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=414(x), r6=85(y), r7=64(width), r8=19(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=329(x), r11=206(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 87
LDI r1, 172
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 414
LDI r6, 85
LDI r7, 64
LDI r8, 19
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 329
LDI r11, 206
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
