; DESCRIPTION: Composite: Renders a orange disk with center (319, 168) and radius 58 then Draws a blue rectangle at (260, 94) with width 71 and height 23 then Sets a single black pixel at (78, 161).
; PLAN: r0=319(x), r1=168(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=260(x), r6=94(y), r7=71(width), r8=23(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=78(x), r11=161(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 319
LDI r1, 168
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 260
LDI r6, 94
LDI r7, 71
LDI r8, 23
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 78
LDI r11, 161
LDI r12, 0x000000
PSET r10, r11, r12
HALT
