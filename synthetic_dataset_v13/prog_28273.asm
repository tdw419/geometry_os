; DESCRIPTION: Composite: Renders a purple box of size 64x78 starting at (148, 159) then Places a black dot at position (25, 219) then Places a white circle of radius 27 at center (472, 99).
; PLAN: r0=148(x), r1=159(y), r2=64(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=25(x), r6=219(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=472(x), r11=99(y), r12=27(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 148
LDI r1, 159
LDI r2, 64
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 25
LDI r6, 219
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 472
LDI r11, 99
LDI r12, 27
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
