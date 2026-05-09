; DESCRIPTION: Composite: Renders a red line between points (426, 136) and (164, 96) then Places a red 17x54 rectangle at position (88, 18) then Places a orange dot at position (111, 62).
; PLAN: r0=426(x1), r1=136(y1), r2=164(x2), r3=96(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=88(x), r6=18(y), r7=17(width), r8=54(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=111(x), r11=62(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 426
LDI r1, 136
LDI r2, 164
LDI r3, 96
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 18
LDI r7, 17
LDI r8, 54
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 111
LDI r11, 62
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
