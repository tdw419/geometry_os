; DESCRIPTION: Composite: Draws a blue rectangle at (173, 21) with width 112 and height 11 then Places a cyan dot at position (81, 41) then Draws a orange circle centered at (294, 22) with radius 11.
; PLAN: r0=173(x), r1=21(y), r2=112(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=81(x), r6=41(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=294(x), r11=22(y), r12=11(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 173
LDI r1, 21
LDI r2, 112
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 81
LDI r6, 41
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 294
LDI r11, 22
LDI r12, 11
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
