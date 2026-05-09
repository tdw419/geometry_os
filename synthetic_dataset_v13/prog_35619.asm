; DESCRIPTION: Composite: Draws a green rectangle at (109, 104) with width 63 and height 99 then Sets a single blue pixel at (208, 254) then Renders a red disk with center (81, 71) and radius 18.
; PLAN: r0=109(x), r1=104(y), r2=63(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=208(x), r6=254(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=81(x), r11=71(y), r12=18(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 109
LDI r1, 104
LDI r2, 63
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 254
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 81
LDI r11, 71
LDI r12, 18
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
