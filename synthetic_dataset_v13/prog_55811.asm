; DESCRIPTION: Composite: Draws a yellow rectangle at (66, 70) with width 26 and height 60 then Sets a single green pixel at (95, 54) then Renders a black disk with center (458, 112) and radius 15.
; PLAN: r0=66(x), r1=70(y), r2=26(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=95(x), r6=54(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=458(x), r11=112(y), r12=15(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 66
LDI r1, 70
LDI r2, 26
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 54
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 458
LDI r11, 112
LDI r12, 15
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
