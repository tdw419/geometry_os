; DESCRIPTION: Composite: Creates a white circular shape at (377, 157) with radius 24 then Places a red dot at position (253, 173) then Draws a black rectangle at (431, 149) with width 10 and height 22.
; PLAN: r0=377(x), r1=157(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=253(x), r6=173(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=431(x), r11=149(y), r12=10(width), r13=22(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 377
LDI r1, 157
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 253
LDI r6, 173
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 431
LDI r11, 149
LDI r12, 10
LDI r13, 22
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
