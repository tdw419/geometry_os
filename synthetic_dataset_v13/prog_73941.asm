; DESCRIPTION: Composite: Places a white 38x76 rectangle at position (358, 18) then Places a blue dot at position (175, 62) then Places a black circle of radius 13 at center (172, 107).
; PLAN: r0=358(x), r1=18(y), r2=38(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=175(x), r6=62(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=172(x), r11=107(y), r12=13(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 358
LDI r1, 18
LDI r2, 38
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 62
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 172
LDI r11, 107
LDI r12, 13
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
