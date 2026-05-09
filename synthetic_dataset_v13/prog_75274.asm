; DESCRIPTION: Composite: Creates a blue rectangular region at (279, 175) spanning 115 by 40 pixels then Creates a red circular shape at (296, 140) with radius 12 then Places a red dot at position (132, 159).
; PLAN: r0=279(x), r1=175(y), r2=115(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=296(x), r6=140(y), r7=12(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=132(x), r11=159(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 279
LDI r1, 175
LDI r2, 115
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 296
LDI r6, 140
LDI r7, 12
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 132
LDI r11, 159
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
