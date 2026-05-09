; DESCRIPTION: Composite: Places a magenta dot at position (315, 1) then Draws a red rectangle at (3, 8) with width 65 and height 118 then Places a purple circle of radius 35 at center (173, 216).
; PLAN: r0=315(x), r1=1(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=3(x), r6=8(y), r7=65(width), r8=118(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=173(x), r11=216(y), r12=35(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 315
LDI r1, 1
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 3
LDI r6, 8
LDI r7, 65
LDI r8, 118
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 173
LDI r11, 216
LDI r12, 35
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
