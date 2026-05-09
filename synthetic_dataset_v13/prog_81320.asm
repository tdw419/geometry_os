; DESCRIPTION: Composite: Draws a magenta circle centered at (240, 228) with radius 18 then Sets a single black pixel at (287, 153) then Places a orange 43x101 rectangle at position (32, 131).
; PLAN: r0=240(x), r1=228(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=287(x), r6=153(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=32(x), r11=131(y), r12=43(width), r13=101(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 240
LDI r1, 228
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 287
LDI r6, 153
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 32
LDI r11, 131
LDI r12, 43
LDI r13, 101
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
