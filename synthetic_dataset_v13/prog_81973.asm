; DESCRIPTION: Composite: Draws a red line from (451, 248) to (351, 14) then Places a yellow dot at position (74, 176) then Creates a green rectangular region at (304, 125) spanning 109 by 111 pixels.
; PLAN: r0=451(x1), r1=248(y1), r2=351(x2), r3=14(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=74(x), r6=176(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=304(x), r11=125(y), r12=109(width), r13=111(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 451
LDI r1, 248
LDI r2, 351
LDI r3, 14
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 176
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 304
LDI r11, 125
LDI r12, 109
LDI r13, 111
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
