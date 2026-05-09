; DESCRIPTION: Composite: Creates a purple circular shape at (348, 170) with radius 62 then Places a green dot at position (419, 241) then Draws a magenta rectangle at (251, 198) with width 54 and height 37.
; PLAN: r0=348(x), r1=170(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=419(x), r6=241(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=251(x), r11=198(y), r12=54(width), r13=37(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 348
LDI r1, 170
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 419
LDI r6, 241
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 251
LDI r11, 198
LDI r12, 54
LDI r13, 37
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
