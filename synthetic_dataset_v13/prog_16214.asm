; DESCRIPTION: Composite: Sets a single white pixel at (140, 81) then Renders a yellow box of size 50x33 starting at (364, 59) then Draws a purple circle centered at (390, 118) with radius 28.
; PLAN: r0=140(x), r1=81(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=364(x), r6=59(y), r7=50(width), r8=33(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=390(x), r11=118(y), r12=28(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 140
LDI r1, 81
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 364
LDI r6, 59
LDI r7, 50
LDI r8, 33
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 390
LDI r11, 118
LDI r12, 28
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
