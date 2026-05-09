; DESCRIPTION: Composite: Places a blue circle of radius 36 at center (44, 165) then Renders a yellow box of size 47x74 starting at (343, 117) then Places a black dot at position (430, 156).
; PLAN: r0=44(x), r1=165(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=343(x), r6=117(y), r7=47(width), r8=74(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=430(x), r11=156(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 44
LDI r1, 165
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 343
LDI r6, 117
LDI r7, 47
LDI r8, 74
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 430
LDI r11, 156
LDI r12, 0x000000
PSET r10, r11, r12
HALT
