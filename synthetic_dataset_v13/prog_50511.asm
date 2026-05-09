; DESCRIPTION: Composite: Creates a orange circular shape at (414, 85) with radius 73 then Renders a orange box of size 86x28 starting at (107, 18) then Sets a single purple pixel at (60, 218).
; PLAN: r0=414(x), r1=85(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=107(x), r6=18(y), r7=86(width), r8=28(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=60(x), r11=218(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 414
LDI r1, 85
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 107
LDI r6, 18
LDI r7, 86
LDI r8, 28
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 60
LDI r11, 218
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
