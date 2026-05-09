; DESCRIPTION: Composite: Places a black circle of radius 74 at center (139, 134) then Places a red dot at position (241, 4) then Renders a orange box of size 105x105 starting at (45, 99).
; PLAN: r0=139(x), r1=134(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=241(x), r6=4(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=45(x), r11=99(y), r12=105(width), r13=105(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 139
LDI r1, 134
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 241
LDI r6, 4
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 45
LDI r11, 99
LDI r12, 105
LDI r13, 105
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
