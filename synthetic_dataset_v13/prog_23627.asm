; DESCRIPTION: Composite: Sets a single white pixel at (312, 70) then Renders a white box of size 42x78 starting at (259, 53) then Places a orange circle of radius 11 at center (456, 158).
; PLAN: r0=312(x), r1=70(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=259(x), r6=53(y), r7=42(width), r8=78(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=456(x), r11=158(y), r12=11(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 312
LDI r1, 70
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 259
LDI r6, 53
LDI r7, 42
LDI r8, 78
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 456
LDI r11, 158
LDI r12, 11
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
