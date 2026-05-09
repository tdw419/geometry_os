; DESCRIPTION: Composite: Places a red 27x96 rectangle at position (354, 13) then Draws a purple circle centered at (89, 150) with radius 63 then Sets a single black pixel at (370, 188).
; PLAN: r0=354(x), r1=13(y), r2=27(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=89(x), r6=150(y), r7=63(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=370(x), r11=188(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 354
LDI r1, 13
LDI r2, 27
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 89
LDI r6, 150
LDI r7, 63
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 370
LDI r11, 188
LDI r12, 0x000000
PSET r10, r11, r12
HALT
