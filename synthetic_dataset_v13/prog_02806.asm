; DESCRIPTION: Composite: Draws a orange circle centered at (388, 89) with radius 18 then Places a green 49x118 rectangle at position (374, 73) then Places a yellow dot at position (306, 120).
; PLAN: r0=388(x), r1=89(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=374(x), r6=73(y), r7=49(width), r8=118(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=306(x), r11=120(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 388
LDI r1, 89
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 374
LDI r6, 73
LDI r7, 49
LDI r8, 118
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 306
LDI r11, 120
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
