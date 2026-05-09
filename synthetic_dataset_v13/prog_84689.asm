; DESCRIPTION: Composite: Places a orange dot at position (297, 99) then Places a white circle of radius 31 at center (239, 97) then Creates a yellow rectangular region at (65, 8) spanning 23 by 40 pixels.
; PLAN: r0=297(x), r1=99(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=239(x), r6=97(y), r7=31(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=65(x), r11=8(y), r12=23(width), r13=40(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 297
LDI r1, 99
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 239
LDI r6, 97
LDI r7, 31
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 65
LDI r11, 8
LDI r12, 23
LDI r13, 40
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
