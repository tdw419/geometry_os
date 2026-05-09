; DESCRIPTION: Composite: Sets a single black pixel at (455, 10) then Places a black 62x118 rectangle at position (5, 25) then Renders a red disk with center (67, 210) and radius 43.
; PLAN: r0=455(x), r1=10(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=5(x), r6=25(y), r7=62(width), r8=118(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=67(x), r11=210(y), r12=43(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 455
LDI r1, 10
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 5
LDI r6, 25
LDI r7, 62
LDI r8, 118
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 67
LDI r11, 210
LDI r12, 43
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
