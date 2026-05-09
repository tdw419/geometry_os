; DESCRIPTION: Composite: Places a red dot at position (316, 36) then Draws a green rectangle at (32, 142) with width 113 and height 94 then Places a black circle of radius 18 at center (117, 19).
; PLAN: r0=316(x), r1=36(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=32(x), r6=142(y), r7=113(width), r8=94(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=117(x), r11=19(y), r12=18(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 316
LDI r1, 36
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 32
LDI r6, 142
LDI r7, 113
LDI r8, 94
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 117
LDI r11, 19
LDI r12, 18
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
