; DESCRIPTION: Composite: Renders a black disk with center (120, 169) and radius 58 then Draws a purple rectangle at (9, 81) with width 47 and height 89 then Sets a single magenta pixel at (435, 205).
; PLAN: r0=120(x), r1=169(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=9(x), r6=81(y), r7=47(width), r8=89(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=435(x), r11=205(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 120
LDI r1, 169
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 9
LDI r6, 81
LDI r7, 47
LDI r8, 89
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 435
LDI r11, 205
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
