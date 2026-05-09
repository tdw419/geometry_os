; DESCRIPTION: Composite: Creates a black rectangular region at (164, 125) spanning 53 by 75 pixels then Places a red dot at position (374, 208) then Creates a orange circular shape at (375, 111) with radius 40.
; PLAN: r0=164(x), r1=125(y), r2=53(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=374(x), r6=208(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=375(x), r11=111(y), r12=40(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 164
LDI r1, 125
LDI r2, 53
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 208
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 375
LDI r11, 111
LDI r12, 40
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
