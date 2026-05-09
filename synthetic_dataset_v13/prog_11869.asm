; DESCRIPTION: Composite: Places a blue dot at position (268, 7) then Draws a white line from (283, 251) to (44, 88) then Draws a orange rectangle at (145, 140) with width 68 and height 30.
; PLAN: r0=268(x), r1=7(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=283(x1), r6=251(y1), r7=44(x2), r8=88(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=145(x), r11=140(y), r12=68(width), r13=30(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 268
LDI r1, 7
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 283
LDI r6, 251
LDI r7, 44
LDI r8, 88
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 145
LDI r11, 140
LDI r12, 68
LDI r13, 30
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
