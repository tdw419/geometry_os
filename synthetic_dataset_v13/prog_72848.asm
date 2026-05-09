; DESCRIPTION: Composite: Renders a black box of size 106x49 starting at (31, 180) then Draws a blue circle centered at (151, 41) with radius 14 then Sets a single black pixel at (108, 137).
; PLAN: r0=31(x), r1=180(y), r2=106(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=151(x), r6=41(y), r7=14(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=108(x), r11=137(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 31
LDI r1, 180
LDI r2, 106
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 41
LDI r7, 14
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 108
LDI r11, 137
LDI r12, 0x000000
PSET r10, r11, r12
HALT
