; DESCRIPTION: Composite: Renders a red disk with center (221, 86) and radius 57 then Places a black dot at position (2, 114) then Draws a green rectangle at (115, 191) with width 76 and height 15.
; PLAN: r0=221(x), r1=86(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=2(x), r6=114(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=115(x), r11=191(y), r12=76(width), r13=15(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 221
LDI r1, 86
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 2
LDI r6, 114
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 115
LDI r11, 191
LDI r12, 76
LDI r13, 15
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
