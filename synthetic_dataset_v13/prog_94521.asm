; DESCRIPTION: Composite: Places a cyan line segment connecting (161, 11) to (12, 172) then Draws a black circle centered at (101, 72) with radius 18 then Places a black dot at position (306, 106).
; PLAN: r0=161(x1), r1=11(y1), r2=12(x2), r3=172(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=101(x), r6=72(y), r7=18(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=306(x), r11=106(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 161
LDI r1, 11
LDI r2, 12
LDI r3, 172
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 101
LDI r6, 72
LDI r7, 18
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 306
LDI r11, 106
LDI r12, 0x000000
PSET r10, r11, r12
HALT
