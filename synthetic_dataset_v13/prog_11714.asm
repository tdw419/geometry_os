; DESCRIPTION: Composite: Renders a orange box of size 41x16 starting at (375, 173) then Places a red dot at position (323, 249) then Draws a green circle centered at (134, 135) with radius 29.
; PLAN: r0=375(x), r1=173(y), r2=41(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=323(x), r6=249(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=134(x), r11=135(y), r12=29(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 375
LDI r1, 173
LDI r2, 41
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 323
LDI r6, 249
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 134
LDI r11, 135
LDI r12, 29
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
