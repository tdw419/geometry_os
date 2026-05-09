; DESCRIPTION: Composite: Draws a yellow circle centered at (439, 81) with radius 16 then Draws a red rectangle at (485, 73) with width 14 and height 10 then Places a orange dot at position (319, 166).
; PLAN: r0=439(x), r1=81(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=485(x), r6=73(y), r7=14(width), r8=10(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=319(x), r11=166(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 439
LDI r1, 81
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 485
LDI r6, 73
LDI r7, 14
LDI r8, 10
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 319
LDI r11, 166
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
