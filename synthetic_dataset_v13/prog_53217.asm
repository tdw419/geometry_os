; DESCRIPTION: Composite: Places a orange line segment connecting (348, 190) to (219, 250) then Places a yellow dot at position (52, 141) then Draws a yellow rectangle at (201, 167) with width 28 and height 48.
; PLAN: r0=348(x1), r1=190(y1), r2=219(x2), r3=250(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=52(x), r6=141(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=201(x), r11=167(y), r12=28(width), r13=48(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 348
LDI r1, 190
LDI r2, 219
LDI r3, 250
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 52
LDI r6, 141
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 201
LDI r11, 167
LDI r12, 28
LDI r13, 48
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
