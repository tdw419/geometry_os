; DESCRIPTION: Composite: Places a white dot at position (111, 97) then Draws a orange line from (253, 54) to (245, 103) then Draws a white rectangle at (261, 87) with width 44 and height 63.
; PLAN: r0=111(x), r1=97(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=253(x1), r6=54(y1), r7=245(x2), r8=103(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=261(x), r11=87(y), r12=44(width), r13=63(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 111
LDI r1, 97
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 253
LDI r6, 54
LDI r7, 245
LDI r8, 103
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 261
LDI r11, 87
LDI r12, 44
LDI r13, 63
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
