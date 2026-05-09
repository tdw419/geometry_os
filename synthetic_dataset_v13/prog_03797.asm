; DESCRIPTION: Composite: Places a orange circle of radius 74 at center (220, 127) then Sets a single cyan pixel at (3, 246) then Creates a green rectangular region at (341, 139) spanning 114 by 15 pixels.
; PLAN: r0=220(x), r1=127(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=3(x), r6=246(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=341(x), r11=139(y), r12=114(width), r13=15(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 220
LDI r1, 127
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 3
LDI r6, 246
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 341
LDI r11, 139
LDI r12, 114
LDI r13, 15
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
