; DESCRIPTION: Composite: Creates a red rectangular region at (126, 106) spanning 41 by 13 pixels then Places a blue dot at position (123, 193) then Draws a black circle centered at (142, 98) with radius 46.
; PLAN: r0=126(x), r1=106(y), r2=41(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=123(x), r6=193(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=142(x), r11=98(y), r12=46(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 126
LDI r1, 106
LDI r2, 41
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 193
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 142
LDI r11, 98
LDI r12, 46
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
