; DESCRIPTION: Composite: Places a purple dot at position (170, 135) then Draws a orange rectangle at (412, 11) with width 83 and height 19 then Draws a black circle centered at (96, 187) with radius 66.
; PLAN: r0=170(x), r1=135(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=412(x), r6=11(y), r7=83(width), r8=19(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=96(x), r11=187(y), r12=66(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 170
LDI r1, 135
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 412
LDI r6, 11
LDI r7, 83
LDI r8, 19
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 96
LDI r11, 187
LDI r12, 66
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
