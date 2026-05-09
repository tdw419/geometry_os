; DESCRIPTION: Composite: Sets a single blue pixel at (152, 137) then Places a yellow 62x54 rectangle at position (291, 58) then Creates a yellow circular shape at (255, 114) with radius 66.
; PLAN: r0=152(x), r1=137(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=291(x), r6=58(y), r7=62(width), r8=54(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=255(x), r11=114(y), r12=66(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 152
LDI r1, 137
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 291
LDI r6, 58
LDI r7, 62
LDI r8, 54
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 255
LDI r11, 114
LDI r12, 66
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
