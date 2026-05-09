; DESCRIPTION: Composite: Sets a single black pixel at (43, 15) then Renders a purple box of size 106x46 starting at (87, 3) then Draws a purple line from (144, 14) to (357, 178).
; PLAN: r0=43(x), r1=15(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=87(x), r6=3(y), r7=106(width), r8=46(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=144(x1), r11=14(y1), r12=357(x2), r13=178(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 43
LDI r1, 15
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 87
LDI r6, 3
LDI r7, 106
LDI r8, 46
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 144
LDI r11, 14
LDI r12, 357
LDI r13, 178
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
