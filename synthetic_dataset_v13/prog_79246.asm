; DESCRIPTION: Composite: Places a purple 27x10 rectangle at position (145, 34) then Places a yellow dot at position (115, 175) then Draws a blue circle centered at (107, 78) with radius 73.
; PLAN: r0=145(x), r1=34(y), r2=27(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=115(x), r6=175(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=107(x), r11=78(y), r12=73(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 145
LDI r1, 34
LDI r2, 27
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 175
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 107
LDI r11, 78
LDI r12, 73
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
