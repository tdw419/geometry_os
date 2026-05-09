; DESCRIPTION: Composite: Renders a white disk with center (371, 157) and radius 56 then Places a red dot at position (278, 8) then Places a blue 76x33 rectangle at position (41, 147).
; PLAN: r0=371(x), r1=157(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=278(x), r6=8(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=41(x), r11=147(y), r12=76(width), r13=33(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 371
LDI r1, 157
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 278
LDI r6, 8
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 41
LDI r11, 147
LDI r12, 76
LDI r13, 33
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
