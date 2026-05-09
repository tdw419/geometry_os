; DESCRIPTION: Composite: Places a orange dot at position (341, 247) then Places a blue 42x28 rectangle at position (173, 10) then Creates a orange circular shape at (144, 170) with radius 77.
; PLAN: r0=341(x), r1=247(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=173(x), r6=10(y), r7=42(width), r8=28(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=144(x), r11=170(y), r12=77(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 341
LDI r1, 247
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 173
LDI r6, 10
LDI r7, 42
LDI r8, 28
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 144
LDI r11, 170
LDI r12, 77
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
