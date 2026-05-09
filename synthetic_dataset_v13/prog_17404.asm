; DESCRIPTION: Composite: Renders a purple box of size 17x107 starting at (268, 58) then Renders a white disk with center (100, 195) and radius 24 then Sets a single cyan pixel at (380, 122).
; PLAN: r0=268(x), r1=58(y), r2=17(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=100(x), r6=195(y), r7=24(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=380(x), r11=122(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 268
LDI r1, 58
LDI r2, 17
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 195
LDI r7, 24
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 380
LDI r11, 122
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
