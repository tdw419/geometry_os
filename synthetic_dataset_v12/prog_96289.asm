; DESCRIPTION: Composite: Places a orange line segment connecting (183, 43) to (171, 254) then Sets a single cyan pixel at (105, 119) then Places a white 60x33 rectangle at position (76, 199).
; PLAN: r0=183(x1), r1=43(y1), r2=171(x2), r3=254(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=105(x), r6=119(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=76(x), r11=199(y), r12=60(width), r13=33(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 183
LDI r1, 43
LDI r2, 171
LDI r3, 254
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 119
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 76
LDI r11, 199
LDI r12, 60
LDI r13, 33
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
