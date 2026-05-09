; DESCRIPTION: Composite: Places a blue 93x113 rectangle at position (261, 6) then Creates a yellow circular shape at (241, 147) with radius 28 then Sets a single cyan pixel at (471, 90).
; PLAN: r0=261(x), r1=6(y), r2=93(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=241(x), r6=147(y), r7=28(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=471(x), r11=90(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 261
LDI r1, 6
LDI r2, 93
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 147
LDI r7, 28
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 471
LDI r11, 90
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
