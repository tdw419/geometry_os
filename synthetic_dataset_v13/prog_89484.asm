; DESCRIPTION: Composite: Renders a purple box of size 106x37 starting at (347, 138) then Draws a white line from (83, 82) to (465, 148) then Creates a white circular shape at (237, 97) with radius 66.
; PLAN: r0=347(x), r1=138(y), r2=106(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=83(x1), r6=82(y1), r7=465(x2), r8=148(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=237(x), r11=97(y), r12=66(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 347
LDI r1, 138
LDI r2, 106
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 82
LDI r7, 465
LDI r8, 148
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 237
LDI r11, 97
LDI r12, 66
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
