; DESCRIPTION: Composite: Draws a red rectangle at (414, 240) with width 94 and height 16 then Sets a single red pixel at (84, 138) then Renders a red disk with center (339, 141) and radius 64.
; PLAN: r0=414(x), r1=240(y), r2=94(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=84(x), r6=138(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=339(x), r11=141(y), r12=64(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 414
LDI r1, 240
LDI r2, 94
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 138
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 339
LDI r11, 141
LDI r12, 64
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
