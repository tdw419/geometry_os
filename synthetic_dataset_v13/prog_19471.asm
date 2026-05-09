; DESCRIPTION: Composite: Sets a single yellow pixel at (247, 198) then Places a yellow 15x71 rectangle at position (74, 41) then Places a yellow circle of radius 40 at center (239, 108).
; PLAN: r0=247(x), r1=198(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=74(x), r6=41(y), r7=15(width), r8=71(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=239(x), r11=108(y), r12=40(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 247
LDI r1, 198
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 74
LDI r6, 41
LDI r7, 15
LDI r8, 71
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 239
LDI r11, 108
LDI r12, 40
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
