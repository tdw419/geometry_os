; DESCRIPTION: Composite: Draws a purple rectangle at (58, 167) with width 89 and height 84 then Sets a single cyan pixel at (27, 67) then Renders a red disk with center (338, 165) and radius 50.
; PLAN: r0=58(x), r1=167(y), r2=89(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=27(x), r6=67(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=338(x), r11=165(y), r12=50(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 58
LDI r1, 167
LDI r2, 89
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 27
LDI r6, 67
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 338
LDI r11, 165
LDI r12, 50
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
