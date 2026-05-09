; DESCRIPTION: Composite: Places a magenta dot at position (87, 0) then Draws a green line from (374, 43) to (341, 130) then Creates a blue rectangular region at (364, 70) spanning 81 by 114 pixels.
; PLAN: r0=87(x), r1=0(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=374(x1), r6=43(y1), r7=341(x2), r8=130(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=364(x), r11=70(y), r12=81(width), r13=114(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 87
LDI r1, 0
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 374
LDI r6, 43
LDI r7, 341
LDI r8, 130
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 364
LDI r11, 70
LDI r12, 81
LDI r13, 114
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
