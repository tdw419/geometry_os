; DESCRIPTION: Composite: Places a purple dot at position (280, 101) then Renders a blue line between points (422, 170) and (208, 17) then Draws a purple rectangle at (146, 179) with width 117 and height 28.
; PLAN: r0=280(x), r1=101(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=422(x1), r6=170(y1), r7=208(x2), r8=17(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=146(x), r11=179(y), r12=117(width), r13=28(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 280
LDI r1, 101
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 422
LDI r6, 170
LDI r7, 208
LDI r8, 17
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 146
LDI r11, 179
LDI r12, 117
LDI r13, 28
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
