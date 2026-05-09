; DESCRIPTION: Composite: Renders a purple disk with center (337, 150) and radius 43 then Draws a white rectangle at (172, 98) with width 72 and height 52 then Places a black dot at position (70, 201).
; PLAN: r0=337(x), r1=150(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=172(x), r6=98(y), r7=72(width), r8=52(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=70(x), r11=201(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 337
LDI r1, 150
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 172
LDI r6, 98
LDI r7, 72
LDI r8, 52
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 70
LDI r11, 201
LDI r12, 0x000000
PSET r10, r11, r12
HALT
