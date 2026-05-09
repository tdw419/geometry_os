; DESCRIPTION: Composite: Draws a yellow rectangle at (312, 34) with width 27 and height 103 then Renders a blue disk with center (390, 86) and radius 78 then Places a black dot at position (0, 23).
; PLAN: r0=312(x), r1=34(y), r2=27(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=390(x), r6=86(y), r7=78(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=0(x), r11=23(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 312
LDI r1, 34
LDI r2, 27
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 86
LDI r7, 78
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 0
LDI r11, 23
LDI r12, 0x000000
PSET r10, r11, r12
HALT
