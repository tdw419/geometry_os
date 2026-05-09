; DESCRIPTION: Composite: Places a yellow dot at position (320, 117) then Places a green line segment connecting (318, 29) to (274, 3) then Draws a orange circle centered at (213, 206) with radius 37.
; PLAN: r0=320(x), r1=117(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=318(x1), r6=29(y1), r7=274(x2), r8=3(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=213(x), r11=206(y), r12=37(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 320
LDI r1, 117
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 318
LDI r6, 29
LDI r7, 274
LDI r8, 3
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 213
LDI r11, 206
LDI r12, 37
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
