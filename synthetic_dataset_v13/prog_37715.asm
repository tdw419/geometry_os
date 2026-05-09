; DESCRIPTION: Composite: Draws a purple rectangle at (49, 34) with width 115 and height 92 then Sets a single green pixel at (453, 134) then Renders a black disk with center (283, 95) and radius 64.
; PLAN: r0=49(x), r1=34(y), r2=115(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=453(x), r6=134(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=283(x), r11=95(y), r12=64(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 49
LDI r1, 34
LDI r2, 115
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 134
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 283
LDI r11, 95
LDI r12, 64
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
