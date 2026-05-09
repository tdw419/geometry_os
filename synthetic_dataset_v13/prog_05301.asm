; DESCRIPTION: Composite: Creates a green circular shape at (210, 62) with radius 26 then Sets a single blue pixel at (364, 59) then Places a white 55x81 rectangle at position (36, 76).
; PLAN: r0=210(x), r1=62(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=364(x), r6=59(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=36(x), r11=76(y), r12=55(width), r13=81(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 210
LDI r1, 62
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 364
LDI r6, 59
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 36
LDI r11, 76
LDI r12, 55
LDI r13, 81
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
