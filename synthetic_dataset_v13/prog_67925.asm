; DESCRIPTION: Composite: Creates a yellow circular shape at (237, 164) with radius 11 then Draws a white rectangle at (436, 241) with width 27 and height 13 then Places a black dot at position (211, 30).
; PLAN: r0=237(x), r1=164(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=436(x), r6=241(y), r7=27(width), r8=13(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=211(x), r11=30(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 237
LDI r1, 164
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 436
LDI r6, 241
LDI r7, 27
LDI r8, 13
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 211
LDI r11, 30
LDI r12, 0x000000
PSET r10, r11, r12
HALT
