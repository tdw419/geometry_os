; DESCRIPTION: Composite: Places a white dot at position (358, 23) then Draws a yellow rectangle at (281, 123) with width 24 and height 41 then Draws a purple circle centered at (327, 150) with radius 71.
; PLAN: r0=358(x), r1=23(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=281(x), r6=123(y), r7=24(width), r8=41(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=327(x), r11=150(y), r12=71(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 358
LDI r1, 23
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 281
LDI r6, 123
LDI r7, 24
LDI r8, 41
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 327
LDI r11, 150
LDI r12, 71
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
