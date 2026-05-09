; DESCRIPTION: Composite: Places a magenta dot at position (347, 178) then Renders a magenta line between points (382, 205) and (322, 83) then Draws a magenta rectangle at (351, 40) with width 91 and height 60.
; PLAN: r0=347(x), r1=178(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=382(x1), r6=205(y1), r7=322(x2), r8=83(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=351(x), r11=40(y), r12=91(width), r13=60(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 347
LDI r1, 178
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 382
LDI r6, 205
LDI r7, 322
LDI r8, 83
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 351
LDI r11, 40
LDI r12, 91
LDI r13, 60
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
