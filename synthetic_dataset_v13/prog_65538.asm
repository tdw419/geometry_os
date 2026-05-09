; DESCRIPTION: Composite: Draws a magenta circle centered at (227, 132) with radius 61 then Places a black dot at position (317, 130) then Places a purple 14x21 rectangle at position (54, 36).
; PLAN: r0=227(x), r1=132(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=317(x), r6=130(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=54(x), r11=36(y), r12=14(width), r13=21(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 227
LDI r1, 132
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 317
LDI r6, 130
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 54
LDI r11, 36
LDI r12, 14
LDI r13, 21
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
