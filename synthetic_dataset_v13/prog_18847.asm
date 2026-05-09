; DESCRIPTION: Composite: Creates a blue circular shape at (43, 158) with radius 33 then Places a orange 15x22 rectangle at position (252, 148) then Places a white dot at position (31, 165).
; PLAN: r0=43(x), r1=158(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=252(x), r6=148(y), r7=15(width), r8=22(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=31(x), r11=165(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 43
LDI r1, 158
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 252
LDI r6, 148
LDI r7, 15
LDI r8, 22
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 31
LDI r11, 165
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
