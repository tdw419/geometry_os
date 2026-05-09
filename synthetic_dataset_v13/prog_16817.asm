; DESCRIPTION: Composite: Sets a single blue pixel at (16, 132) then Draws a white circle centered at (81, 209) with radius 43 then Draws a blue rectangle at (46, 128) with width 101 and height 76.
; PLAN: r0=16(x), r1=132(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=81(x), r6=209(y), r7=43(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=46(x), r11=128(y), r12=101(width), r13=76(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 16
LDI r1, 132
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 81
LDI r6, 209
LDI r7, 43
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 46
LDI r11, 128
LDI r12, 101
LDI r13, 76
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
