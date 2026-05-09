; DESCRIPTION: Composite: Draws a cyan rectangle at (122, 109) with width 98 and height 89 then Sets a single white pixel at (115, 201) then Creates a white circular shape at (187, 164) with radius 65.
; PLAN: r0=122(x), r1=109(y), r2=98(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=115(x), r6=201(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=187(x), r11=164(y), r12=65(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 122
LDI r1, 109
LDI r2, 98
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 201
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 187
LDI r11, 164
LDI r12, 65
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
