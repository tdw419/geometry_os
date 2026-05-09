; DESCRIPTION: Composite: Places a orange dot at position (112, 84) then Renders a purple box of size 12x13 starting at (461, 104) then Draws a yellow circle centered at (237, 60) with radius 36.
; PLAN: r0=112(x), r1=84(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=461(x), r6=104(y), r7=12(width), r8=13(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=237(x), r11=60(y), r12=36(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 112
LDI r1, 84
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 461
LDI r6, 104
LDI r7, 12
LDI r8, 13
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 237
LDI r11, 60
LDI r12, 36
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
