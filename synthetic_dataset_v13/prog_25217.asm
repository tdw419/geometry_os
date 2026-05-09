; DESCRIPTION: Composite: Renders a black disk with center (142, 137) and radius 68 then Places a red 26x14 rectangle at position (444, 88) then Sets a single green pixel at (321, 162).
; PLAN: r0=142(x), r1=137(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=444(x), r6=88(y), r7=26(width), r8=14(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=321(x), r11=162(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 142
LDI r1, 137
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 444
LDI r6, 88
LDI r7, 26
LDI r8, 14
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 321
LDI r11, 162
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
