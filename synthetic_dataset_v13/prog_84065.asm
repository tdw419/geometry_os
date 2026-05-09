; DESCRIPTION: Composite: Draws a cyan rectangle at (137, 98) with width 83 and height 102 then Draws a cyan circle centered at (402, 52) with radius 39 then Sets a single red pixel at (272, 26).
; PLAN: r0=137(x), r1=98(y), r2=83(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=402(x), r6=52(y), r7=39(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=272(x), r11=26(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 137
LDI r1, 98
LDI r2, 83
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 52
LDI r7, 39
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 272
LDI r11, 26
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
