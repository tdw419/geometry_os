; DESCRIPTION: Composite: Creates a green circular shape at (402, 160) with radius 30 then Draws a magenta rectangle at (435, 170) with width 58 and height 27 then Sets a single red pixel at (280, 222).
; PLAN: r0=402(x), r1=160(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=435(x), r6=170(y), r7=58(width), r8=27(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=280(x), r11=222(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 402
LDI r1, 160
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 435
LDI r6, 170
LDI r7, 58
LDI r8, 27
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 280
LDI r11, 222
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
