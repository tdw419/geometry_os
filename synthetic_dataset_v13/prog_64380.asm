; DESCRIPTION: Composite: Places a blue dot at position (8, 199) then Draws a cyan circle centered at (73, 101) with radius 59 then Places a white 90x17 rectangle at position (376, 163).
; PLAN: r0=8(x), r1=199(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=73(x), r6=101(y), r7=59(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=376(x), r11=163(y), r12=90(width), r13=17(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 8
LDI r1, 199
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 73
LDI r6, 101
LDI r7, 59
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 376
LDI r11, 163
LDI r12, 90
LDI r13, 17
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
