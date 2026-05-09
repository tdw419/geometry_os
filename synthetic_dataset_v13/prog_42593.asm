; DESCRIPTION: Composite: Sets a single yellow pixel at (300, 34) then Creates a black rectangular region at (362, 174) spanning 101 by 51 pixels then Creates a green circular shape at (479, 86) with radius 18.
; PLAN: r0=300(x), r1=34(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=362(x), r6=174(y), r7=101(width), r8=51(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=479(x), r11=86(y), r12=18(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 300
LDI r1, 34
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 362
LDI r6, 174
LDI r7, 101
LDI r8, 51
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 479
LDI r11, 86
LDI r12, 18
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
