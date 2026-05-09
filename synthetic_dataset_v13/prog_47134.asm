; DESCRIPTION: Composite: Places a black circle of radius 39 at center (300, 176) then Places a purple dot at position (49, 203) then Renders a orange box of size 20x66 starting at (311, 71).
; PLAN: r0=300(x), r1=176(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=49(x), r6=203(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=311(x), r11=71(y), r12=20(width), r13=66(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 300
LDI r1, 176
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 49
LDI r6, 203
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 311
LDI r11, 71
LDI r12, 20
LDI r13, 66
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
