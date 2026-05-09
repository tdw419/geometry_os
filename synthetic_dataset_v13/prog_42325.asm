; DESCRIPTION: Composite: Places a yellow 16x34 rectangle at position (15, 143) then Renders a black disk with center (85, 49) and radius 46 then Places a orange dot at position (74, 199).
; PLAN: r0=15(x), r1=143(y), r2=16(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=85(x), r6=49(y), r7=46(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=74(x), r11=199(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 15
LDI r1, 143
LDI r2, 16
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 49
LDI r7, 46
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 74
LDI r11, 199
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
