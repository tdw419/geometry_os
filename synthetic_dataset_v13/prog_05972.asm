; DESCRIPTION: Composite: Places a red 58x64 rectangle at position (179, 77) then Places a orange dot at position (88, 51) then Renders a black disk with center (244, 38) and radius 32.
; PLAN: r0=179(x), r1=77(y), r2=58(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=88(x), r6=51(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=244(x), r11=38(y), r12=32(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 179
LDI r1, 77
LDI r2, 58
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 51
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 244
LDI r11, 38
LDI r12, 32
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
