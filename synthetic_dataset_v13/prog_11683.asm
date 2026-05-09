; DESCRIPTION: Composite: Draws a yellow circle centered at (332, 159) with radius 79 then Places a red dot at position (86, 7) then Creates a magenta rectangular region at (330, 101) spanning 16 by 41 pixels.
; PLAN: r0=332(x), r1=159(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=86(x), r6=7(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=330(x), r11=101(y), r12=16(width), r13=41(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 332
LDI r1, 159
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 86
LDI r6, 7
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 330
LDI r11, 101
LDI r12, 16
LDI r13, 41
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
