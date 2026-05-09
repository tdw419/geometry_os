; DESCRIPTION: Composite: Places a yellow dot at position (182, 43) then Draws a red line from (402, 110) to (318, 177) then Creates a black rectangular region at (230, 177) spanning 23 by 33 pixels.
; PLAN: r0=182(x), r1=43(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=402(x1), r6=110(y1), r7=318(x2), r8=177(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=230(x), r11=177(y), r12=23(width), r13=33(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 182
LDI r1, 43
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 402
LDI r6, 110
LDI r7, 318
LDI r8, 177
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 230
LDI r11, 177
LDI r12, 23
LDI r13, 33
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
