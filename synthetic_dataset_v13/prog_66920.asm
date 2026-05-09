; DESCRIPTION: Composite: Renders a purple box of size 23x11 starting at (396, 211) then Sets a single yellow pixel at (427, 194) then Draws a magenta circle centered at (225, 73) with radius 26.
; PLAN: r0=396(x), r1=211(y), r2=23(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=427(x), r6=194(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=225(x), r11=73(y), r12=26(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 396
LDI r1, 211
LDI r2, 23
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 427
LDI r6, 194
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 225
LDI r11, 73
LDI r12, 26
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
