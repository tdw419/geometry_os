; DESCRIPTION: Composite: Sets a single green pixel at (112, 41) then Places a cyan 94x72 rectangle at position (166, 41) then Places a white circle of radius 63 at center (222, 121).
; PLAN: r0=112(x), r1=41(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=166(x), r6=41(y), r7=94(width), r8=72(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=222(x), r11=121(y), r12=63(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 112
LDI r1, 41
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 166
LDI r6, 41
LDI r7, 94
LDI r8, 72
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 222
LDI r11, 121
LDI r12, 63
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
