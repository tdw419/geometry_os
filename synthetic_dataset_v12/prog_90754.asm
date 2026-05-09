; DESCRIPTION: Composite: Places a red 23x79 rectangle at position (169, 130) then Draws a black circle centered at (49, 60) with radius 44 then Places a black dot at position (358, 181).
; PLAN: r0=169(x), r1=130(y), r2=23(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=49(x), r6=60(y), r7=44(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=358(x), r11=181(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 169
LDI r1, 130
LDI r2, 23
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 49
LDI r6, 60
LDI r7, 44
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 358
LDI r11, 181
LDI r12, 0x000000
PSET r10, r11, r12
HALT
