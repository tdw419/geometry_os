; DESCRIPTION: Composite: Creates a green rectangular region at (100, 88) spanning 19 by 51 pixels then Places a orange circle of radius 46 at center (309, 179) then Places a red dot at position (380, 203).
; PLAN: r0=100(x), r1=88(y), r2=19(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=309(x), r6=179(y), r7=46(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=380(x), r11=203(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 100
LDI r1, 88
LDI r2, 19
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 309
LDI r6, 179
LDI r7, 46
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 380
LDI r11, 203
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
