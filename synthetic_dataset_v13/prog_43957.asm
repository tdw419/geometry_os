; DESCRIPTION: Composite: Sets a single blue pixel at (12, 56) then Draws a blue rectangle at (217, 35) with width 20 and height 101 then Renders a orange line between points (319, 21) and (508, 140).
; PLAN: r0=12(x), r1=56(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=217(x), r6=35(y), r7=20(width), r8=101(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=319(x1), r11=21(y1), r12=508(x2), r13=140(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 12
LDI r1, 56
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 217
LDI r6, 35
LDI r7, 20
LDI r8, 101
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 319
LDI r11, 21
LDI r12, 508
LDI r13, 140
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
