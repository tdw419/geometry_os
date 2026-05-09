; DESCRIPTION: Composite: Draws a yellow rectangle at (451, 136) with width 54 and height 116 then Places a orange dot at position (506, 167).
; PLAN: r0=451(x), r1=136(y), r2=54(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=506(x), r6=167(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 451
LDI r1, 136
LDI r2, 54
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 506
LDI r6, 167
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
