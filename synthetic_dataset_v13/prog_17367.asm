; DESCRIPTION: Composite: Draws a yellow rectangle at (259, 186) with width 84 and height 23 then Sets a single black pixel at (191, 28) then Renders a orange disk with center (327, 79) and radius 50.
; PLAN: r0=259(x), r1=186(y), r2=84(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=191(x), r6=28(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=327(x), r11=79(y), r12=50(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 259
LDI r1, 186
LDI r2, 84
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 28
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 327
LDI r11, 79
LDI r12, 50
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
