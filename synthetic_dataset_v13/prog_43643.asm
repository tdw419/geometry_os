; DESCRIPTION: Composite: Places a orange dot at position (49, 106) then Draws a black rectangle at (397, 164) with width 103 and height 33 then Places a yellow circle of radius 32 at center (394, 125).
; PLAN: r0=49(x), r1=106(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=397(x), r6=164(y), r7=103(width), r8=33(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=394(x), r11=125(y), r12=32(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 49
LDI r1, 106
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 397
LDI r6, 164
LDI r7, 103
LDI r8, 33
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 394
LDI r11, 125
LDI r12, 32
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
