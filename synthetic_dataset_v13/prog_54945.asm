; DESCRIPTION: Composite: Draws a yellow circle centered at (476, 206) with radius 15 then Places a black 81x86 rectangle at position (40, 96) then Places a yellow dot at position (6, 249).
; PLAN: r0=476(x), r1=206(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=40(x), r6=96(y), r7=81(width), r8=86(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=6(x), r11=249(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 476
LDI r1, 206
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 40
LDI r6, 96
LDI r7, 81
LDI r8, 86
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 6
LDI r11, 249
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
