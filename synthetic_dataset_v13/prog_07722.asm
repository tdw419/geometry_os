; DESCRIPTION: Composite: Renders a purple disk with center (159, 136) and radius 55 then Renders a orange box of size 82x21 starting at (139, 27) then Sets a single blue pixel at (427, 104).
; PLAN: r0=159(x), r1=136(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=139(x), r6=27(y), r7=82(width), r8=21(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=427(x), r11=104(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 159
LDI r1, 136
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 139
LDI r6, 27
LDI r7, 82
LDI r8, 21
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 427
LDI r11, 104
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
