; DESCRIPTION: Composite: Places a black dot at position (288, 255) then Creates a orange circular shape at (111, 74) with radius 45 then Places a yellow 101x62 rectangle at position (48, 166).
; PLAN: r0=288(x), r1=255(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=111(x), r6=74(y), r7=45(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=48(x), r11=166(y), r12=101(width), r13=62(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 288
LDI r1, 255
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 111
LDI r6, 74
LDI r7, 45
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 48
LDI r11, 166
LDI r12, 101
LDI r13, 62
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
