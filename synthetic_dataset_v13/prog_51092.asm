; DESCRIPTION: Composite: Creates a cyan circular shape at (222, 111) with radius 17 then Sets a single purple pixel at (270, 80) then Draws a purple rectangle at (97, 139) with width 63 and height 85.
; PLAN: r0=222(x), r1=111(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=270(x), r6=80(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=97(x), r11=139(y), r12=63(width), r13=85(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 222
LDI r1, 111
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 270
LDI r6, 80
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 97
LDI r11, 139
LDI r12, 63
LDI r13, 85
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
