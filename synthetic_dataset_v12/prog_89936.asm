; DESCRIPTION: Composite: Renders a white box of size 13x59 starting at (280, 155) then Places a magenta dot at position (379, 210) then Renders a black disk with center (159, 172) and radius 38.
; PLAN: r0=280(x), r1=155(y), r2=13(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=379(x), r6=210(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=159(x), r11=172(y), r12=38(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 280
LDI r1, 155
LDI r2, 13
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 379
LDI r6, 210
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 159
LDI r11, 172
LDI r12, 38
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
