; DESCRIPTION: Composite: Draws a black circle centered at (277, 93) with radius 18 then Places a red dot at position (257, 247) then Draws a red rectangle at (200, 67) with width 112 and height 49.
; PLAN: r0=277(x), r1=93(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=257(x), r6=247(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=200(x), r11=67(y), r12=112(width), r13=49(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 277
LDI r1, 93
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 257
LDI r6, 247
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 200
LDI r11, 67
LDI r12, 112
LDI r13, 49
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
