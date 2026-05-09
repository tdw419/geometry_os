; DESCRIPTION: Composite: Creates a purple circular shape at (488, 123) with radius 19 then Renders a magenta box of size 62x66 starting at (439, 20) then Places a orange dot at position (413, 78).
; PLAN: r0=488(x), r1=123(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=439(x), r6=20(y), r7=62(width), r8=66(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=413(x), r11=78(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 488
LDI r1, 123
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 439
LDI r6, 20
LDI r7, 62
LDI r8, 66
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 413
LDI r11, 78
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
