; DESCRIPTION: Composite: Sets a single orange pixel at (89, 232) then Draws a black rectangle at (39, 91) with width 74 and height 91 then Places a purple circle of radius 26 at center (382, 154).
; PLAN: r0=89(x), r1=232(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=39(x), r6=91(y), r7=74(width), r8=91(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=382(x), r11=154(y), r12=26(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 89
LDI r1, 232
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 39
LDI r6, 91
LDI r7, 74
LDI r8, 91
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 382
LDI r11, 154
LDI r12, 26
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
