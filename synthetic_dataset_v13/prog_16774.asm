; DESCRIPTION: Composite: Draws a magenta circle centered at (241, 117) with radius 26 then Places a white dot at position (29, 46) then Creates a blue rectangular region at (356, 179) spanning 116 by 48 pixels.
; PLAN: r0=241(x), r1=117(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=29(x), r6=46(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=356(x), r11=179(y), r12=116(width), r13=48(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 241
LDI r1, 117
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 29
LDI r6, 46
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 356
LDI r11, 179
LDI r12, 116
LDI r13, 48
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
