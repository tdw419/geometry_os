; DESCRIPTION: Composite: Creates a purple circular shape at (147, 191) with radius 44 then Renders a orange box of size 19x54 starting at (308, 43) then Places a purple dot at position (276, 30).
; PLAN: r0=147(x), r1=191(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=308(x), r6=43(y), r7=19(width), r8=54(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=276(x), r11=30(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 147
LDI r1, 191
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 308
LDI r6, 43
LDI r7, 19
LDI r8, 54
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 276
LDI r11, 30
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
