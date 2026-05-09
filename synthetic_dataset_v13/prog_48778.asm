; DESCRIPTION: Composite: Places a blue circle of radius 65 at center (322, 134) then Draws a red rectangle at (41, 109) with width 114 and height 114 then Sets a single green pixel at (498, 197).
; PLAN: r0=322(x), r1=134(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=41(x), r6=109(y), r7=114(width), r8=114(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=498(x), r11=197(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 322
LDI r1, 134
LDI r2, 65
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 41
LDI r6, 109
LDI r7, 114
LDI r8, 114
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 498
LDI r11, 197
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
