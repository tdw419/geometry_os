; DESCRIPTION: Composite: Renders a red disk with center (136, 104) and radius 68 then Sets a single green pixel at (194, 26) then Draws a magenta rectangle at (94, 149) with width 102 and height 64.
; PLAN: r0=136(x), r1=104(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=194(x), r6=26(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=94(x), r11=149(y), r12=102(width), r13=64(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 136
LDI r1, 104
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 194
LDI r6, 26
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 94
LDI r11, 149
LDI r12, 102
LDI r13, 64
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
