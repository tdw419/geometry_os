; DESCRIPTION: Composite: Sets a single blue pixel at (340, 217) then Renders a white line between points (463, 50) and (334, 13) then Draws a black rectangle at (205, 56) with width 72 and height 98.
; PLAN: r0=340(x), r1=217(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=463(x1), r6=50(y1), r7=334(x2), r8=13(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=205(x), r11=56(y), r12=72(width), r13=98(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 340
LDI r1, 217
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 463
LDI r6, 50
LDI r7, 334
LDI r8, 13
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 205
LDI r11, 56
LDI r12, 72
LDI r13, 98
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
