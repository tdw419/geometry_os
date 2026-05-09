; DESCRIPTION: Composite: Places a green 70x29 rectangle at position (203, 126) then Sets a single blue pixel at (310, 74) then Creates a black circular shape at (240, 205) with radius 36.
; PLAN: r0=203(x), r1=126(y), r2=70(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=310(x), r6=74(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=240(x), r11=205(y), r12=36(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 203
LDI r1, 126
LDI r2, 70
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 310
LDI r6, 74
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 240
LDI r11, 205
LDI r12, 36
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
