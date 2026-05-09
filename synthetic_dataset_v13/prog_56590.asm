; DESCRIPTION: Composite: Draws a orange circle centered at (389, 144) with radius 70 then Renders a black box of size 102x78 starting at (192, 158) then Places a yellow dot at position (72, 174).
; PLAN: r0=389(x), r1=144(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=192(x), r6=158(y), r7=102(width), r8=78(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=72(x), r11=174(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 389
LDI r1, 144
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 192
LDI r6, 158
LDI r7, 102
LDI r8, 78
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 72
LDI r11, 174
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
