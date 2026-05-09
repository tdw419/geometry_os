; DESCRIPTION: Composite: Places a white dot at position (357, 252) then Places a magenta circle of radius 23 at center (143, 90) then Renders a black box of size 114x115 starting at (306, 112).
; PLAN: r0=357(x), r1=252(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=143(x), r6=90(y), r7=23(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=306(x), r11=112(y), r12=114(width), r13=115(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 357
LDI r1, 252
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 143
LDI r6, 90
LDI r7, 23
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 306
LDI r11, 112
LDI r12, 114
LDI r13, 115
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
