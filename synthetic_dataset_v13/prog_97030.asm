; DESCRIPTION: Composite: Places a yellow circle of radius 11 at center (488, 166) then Places a cyan dot at position (109, 125) then Draws a black rectangle at (14, 125) with width 37 and height 117.
; PLAN: r0=488(x), r1=166(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=109(x), r6=125(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=14(x), r11=125(y), r12=37(width), r13=117(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 488
LDI r1, 166
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 109
LDI r6, 125
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 14
LDI r11, 125
LDI r12, 37
LDI r13, 117
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
