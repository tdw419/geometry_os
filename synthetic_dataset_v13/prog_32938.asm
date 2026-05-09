; DESCRIPTION: Composite: Renders a green box of size 31x72 starting at (259, 6) then Places a white dot at position (473, 31) then Creates a yellow circular shape at (308, 70) with radius 42.
; PLAN: r0=259(x), r1=6(y), r2=31(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=473(x), r6=31(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=308(x), r11=70(y), r12=42(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 259
LDI r1, 6
LDI r2, 31
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 473
LDI r6, 31
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 308
LDI r11, 70
LDI r12, 42
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
