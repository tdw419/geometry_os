; DESCRIPTION: Composite: Places a white 100x41 rectangle at position (46, 155) then Sets a single green pixel at (477, 7) then Renders a white disk with center (151, 83) and radius 39.
; PLAN: r0=46(x), r1=155(y), r2=100(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=477(x), r6=7(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=151(x), r11=83(y), r12=39(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 46
LDI r1, 155
LDI r2, 100
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 477
LDI r6, 7
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 151
LDI r11, 83
LDI r12, 39
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
