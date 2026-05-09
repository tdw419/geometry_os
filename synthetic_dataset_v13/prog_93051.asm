; DESCRIPTION: Composite: Places a white circle of radius 20 at center (479, 65) then Places a purple dot at position (278, 123) then Renders a blue box of size 26x44 starting at (211, 94).
; PLAN: r0=479(x), r1=65(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=278(x), r6=123(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=211(x), r11=94(y), r12=26(width), r13=44(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 479
LDI r1, 65
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 278
LDI r6, 123
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 211
LDI r11, 94
LDI r12, 26
LDI r13, 44
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
