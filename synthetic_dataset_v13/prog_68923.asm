; DESCRIPTION: Composite: Places a red 29x23 rectangle at position (381, 224) then Places a blue line segment connecting (128, 17) to (420, 148) then Places a white dot at position (454, 232).
; PLAN: r0=381(x), r1=224(y), r2=29(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=128(x1), r6=17(y1), r7=420(x2), r8=148(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=454(x), r11=232(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 381
LDI r1, 224
LDI r2, 29
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 128
LDI r6, 17
LDI r7, 420
LDI r8, 148
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 454
LDI r11, 232
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
