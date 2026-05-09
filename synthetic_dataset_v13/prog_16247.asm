; DESCRIPTION: Composite: Renders a blue disk with center (41, 118) and radius 15 then Renders a black box of size 114x35 starting at (182, 167) then Places a white dot at position (232, 55).
; PLAN: r0=41(x), r1=118(y), r2=15(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=182(x), r6=167(y), r7=114(width), r8=35(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=232(x), r11=55(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 41
LDI r1, 118
LDI r2, 15
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 182
LDI r6, 167
LDI r7, 114
LDI r8, 35
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 232
LDI r11, 55
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
