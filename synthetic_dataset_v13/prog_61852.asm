; DESCRIPTION: Composite: Creates a cyan rectangular region at (136, 9) spanning 56 by 50 pixels then Places a yellow dot at position (203, 158) then Places a purple circle of radius 46 at center (189, 185).
; PLAN: r0=136(x), r1=9(y), r2=56(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=203(x), r6=158(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=189(x), r11=185(y), r12=46(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 136
LDI r1, 9
LDI r2, 56
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 203
LDI r6, 158
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 189
LDI r11, 185
LDI r12, 46
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
