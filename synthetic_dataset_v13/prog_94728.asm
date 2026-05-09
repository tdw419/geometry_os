; DESCRIPTION: Composite: Renders a black box of size 107x101 starting at (71, 110) then Places a red dot at position (65, 80) then Places a orange circle of radius 72 at center (397, 106).
; PLAN: r0=71(x), r1=110(y), r2=107(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=65(x), r6=80(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=397(x), r11=106(y), r12=72(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 71
LDI r1, 110
LDI r2, 107
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 80
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 397
LDI r11, 106
LDI r12, 72
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
