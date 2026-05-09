; DESCRIPTION: Composite: Renders a black disk with center (163, 31) and radius 12 then Places a cyan 55x56 rectangle at position (29, 122) then Places a purple dot at position (505, 147).
; PLAN: r0=163(x), r1=31(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=29(x), r6=122(y), r7=55(width), r8=56(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=505(x), r11=147(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 163
LDI r1, 31
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 29
LDI r6, 122
LDI r7, 55
LDI r8, 56
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 505
LDI r11, 147
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
