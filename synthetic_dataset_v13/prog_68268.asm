; DESCRIPTION: Composite: Draws a red rectangle at (276, 90) with width 14 and height 101 then Places a magenta dot at position (424, 170) then Places a red circle of radius 31 at center (332, 162).
; PLAN: r0=276(x), r1=90(y), r2=14(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=424(x), r6=170(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=332(x), r11=162(y), r12=31(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 276
LDI r1, 90
LDI r2, 14
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 424
LDI r6, 170
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 332
LDI r11, 162
LDI r12, 31
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
