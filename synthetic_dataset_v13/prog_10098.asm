; DESCRIPTION: Composite: Draws a white rectangle at (363, 90) with width 101 and height 48 then Sets a single cyan pixel at (372, 232) then Places a black circle of radius 51 at center (296, 108).
; PLAN: r0=363(x), r1=90(y), r2=101(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=372(x), r6=232(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=296(x), r11=108(y), r12=51(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 363
LDI r1, 90
LDI r2, 101
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 232
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 296
LDI r11, 108
LDI r12, 51
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
