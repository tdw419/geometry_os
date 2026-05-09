; DESCRIPTION: Composite: Places a orange circle of radius 17 at center (136, 140) then Sets a single cyan pixel at (68, 199) then Renders a magenta box of size 71x62 starting at (24, 74).
; PLAN: r0=136(x), r1=140(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=68(x), r6=199(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=24(x), r11=74(y), r12=71(width), r13=62(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 136
LDI r1, 140
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 68
LDI r6, 199
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 24
LDI r11, 74
LDI r12, 71
LDI r13, 62
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
