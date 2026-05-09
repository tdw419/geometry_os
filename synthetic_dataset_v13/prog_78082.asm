; DESCRIPTION: Composite: Renders a green box of size 107x79 starting at (164, 164) then Places a black dot at position (497, 123) then Draws a cyan circle centered at (455, 172) with radius 46.
; PLAN: r0=164(x), r1=164(y), r2=107(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=497(x), r6=123(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=455(x), r11=172(y), r12=46(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 164
LDI r1, 164
LDI r2, 107
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 497
LDI r6, 123
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 455
LDI r11, 172
LDI r12, 46
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
