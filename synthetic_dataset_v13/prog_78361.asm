; DESCRIPTION: Composite: Places a black circle of radius 65 at center (122, 133) then Draws a white rectangle at (238, 160) with width 105 and height 31 then Sets a single yellow pixel at (187, 107).
; PLAN: r0=122(x), r1=133(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=238(x), r6=160(y), r7=105(width), r8=31(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=187(x), r11=107(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 122
LDI r1, 133
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 238
LDI r6, 160
LDI r7, 105
LDI r8, 31
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 187
LDI r11, 107
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
