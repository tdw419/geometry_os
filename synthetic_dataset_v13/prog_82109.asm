; DESCRIPTION: Composite: Places a white 114x70 rectangle at position (323, 85) then Places a red dot at position (430, 190) then Draws a blue circle centered at (203, 140) with radius 62.
; PLAN: r0=323(x), r1=85(y), r2=114(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=430(x), r6=190(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=203(x), r11=140(y), r12=62(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 323
LDI r1, 85
LDI r2, 114
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 190
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 203
LDI r11, 140
LDI r12, 62
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
