; DESCRIPTION: Composite: Sets a single black pixel at (128, 13) then Draws a red rectangle at (211, 57) with width 66 and height 56 then Places a purple circle of radius 63 at center (220, 148).
; PLAN: r0=128(x), r1=13(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=211(x), r6=57(y), r7=66(width), r8=56(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=220(x), r11=148(y), r12=63(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 128
LDI r1, 13
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 211
LDI r6, 57
LDI r7, 66
LDI r8, 56
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 220
LDI r11, 148
LDI r12, 63
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
