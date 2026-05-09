; DESCRIPTION: Composite: Places a magenta circle of radius 14 at center (324, 170) then Sets a single magenta pixel at (479, 56) then Creates a green rectangular region at (86, 144) spanning 24 by 90 pixels.
; PLAN: r0=324(x), r1=170(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=479(x), r6=56(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=86(x), r11=144(y), r12=24(width), r13=90(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 324
LDI r1, 170
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 479
LDI r6, 56
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 86
LDI r11, 144
LDI r12, 24
LDI r13, 90
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
