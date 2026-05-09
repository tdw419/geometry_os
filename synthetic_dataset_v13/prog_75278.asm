; DESCRIPTION: Composite: Renders a yellow box of size 15x32 starting at (201, 123) then Creates a red circular shape at (113, 173) with radius 53 then Places a black dot at position (440, 128).
; PLAN: r0=201(x), r1=123(y), r2=15(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=113(x), r6=173(y), r7=53(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=440(x), r11=128(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 201
LDI r1, 123
LDI r2, 15
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 173
LDI r7, 53
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 440
LDI r11, 128
LDI r12, 0x000000
PSET r10, r11, r12
HALT
