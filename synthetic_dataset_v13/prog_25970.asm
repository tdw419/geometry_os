; DESCRIPTION: Composite: Draws a cyan circle centered at (414, 146) with radius 80 then Draws a blue rectangle at (30, 167) with width 41 and height 57 then Sets a single purple pixel at (63, 138).
; PLAN: r0=414(x), r1=146(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=30(x), r6=167(y), r7=41(width), r8=57(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=63(x), r11=138(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 414
LDI r1, 146
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 30
LDI r6, 167
LDI r7, 41
LDI r8, 57
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 63
LDI r11, 138
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
