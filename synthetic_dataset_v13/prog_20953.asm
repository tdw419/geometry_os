; DESCRIPTION: Composite: Sets a single red pixel at (141, 56) then Renders a black box of size 40x106 starting at (10, 98) then Creates a orange circular shape at (320, 134) with radius 76.
; PLAN: r0=141(x), r1=56(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=10(x), r6=98(y), r7=40(width), r8=106(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=320(x), r11=134(y), r12=76(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 141
LDI r1, 56
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 10
LDI r6, 98
LDI r7, 40
LDI r8, 106
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 320
LDI r11, 134
LDI r12, 76
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
