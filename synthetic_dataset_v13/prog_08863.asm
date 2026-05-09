; DESCRIPTION: Composite: Draws a red rectangle at (139, 40) with width 38 and height 103 then Places a orange dot at position (44, 241) then Places a yellow circle of radius 22 at center (145, 89).
; PLAN: r0=139(x), r1=40(y), r2=38(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=44(x), r6=241(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=145(x), r11=89(y), r12=22(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 139
LDI r1, 40
LDI r2, 38
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 44
LDI r6, 241
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 145
LDI r11, 89
LDI r12, 22
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
