; DESCRIPTION: Composite: Draws a white circle centered at (128, 101) with radius 15 then Draws a orange line from (276, 130) to (2, 157) then Places a yellow dot at position (341, 9).
; PLAN: r0=128(x), r1=101(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=276(x1), r6=130(y1), r7=2(x2), r8=157(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=341(x), r11=9(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 128
LDI r1, 101
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 276
LDI r6, 130
LDI r7, 2
LDI r8, 157
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 341
LDI r11, 9
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
