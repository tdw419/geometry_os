; DESCRIPTION: Composite: Draws a orange circle centered at (295, 232) with radius 24 then Sets a single red pixel at (362, 15) then Draws a cyan rectangle at (209, 101) with width 73 and height 85.
; PLAN: r0=295(x), r1=232(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=362(x), r6=15(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=209(x), r11=101(y), r12=73(width), r13=85(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 295
LDI r1, 232
LDI r2, 24
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 362
LDI r6, 15
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 209
LDI r11, 101
LDI r12, 73
LDI r13, 85
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
