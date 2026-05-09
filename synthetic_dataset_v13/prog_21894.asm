; DESCRIPTION: Composite: Sets a single black pixel at (325, 140) then Places a orange 44x11 rectangle at position (272, 210) then Places a purple circle of radius 59 at center (269, 83).
; PLAN: r0=325(x), r1=140(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=272(x), r6=210(y), r7=44(width), r8=11(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=269(x), r11=83(y), r12=59(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 325
LDI r1, 140
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 272
LDI r6, 210
LDI r7, 44
LDI r8, 11
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 269
LDI r11, 83
LDI r12, 59
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
