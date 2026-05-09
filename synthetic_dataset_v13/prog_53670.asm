; DESCRIPTION: Composite: Draws a yellow rectangle at (324, 52) with width 31 and height 38 then Draws a orange circle centered at (120, 58) with radius 51 then Sets a single cyan pixel at (390, 144).
; PLAN: r0=324(x), r1=52(y), r2=31(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=120(x), r6=58(y), r7=51(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=390(x), r11=144(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 324
LDI r1, 52
LDI r2, 31
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 58
LDI r7, 51
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 390
LDI r11, 144
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
