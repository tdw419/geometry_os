; DESCRIPTION: Composite: Places a black 12x28 rectangle at position (78, 27) then Places a white dot at position (125, 17) then Places a orange circle of radius 61 at center (370, 97).
; PLAN: r0=78(x), r1=27(y), r2=12(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=125(x), r6=17(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=370(x), r11=97(y), r12=61(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 78
LDI r1, 27
LDI r2, 12
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 17
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 370
LDI r11, 97
LDI r12, 61
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
