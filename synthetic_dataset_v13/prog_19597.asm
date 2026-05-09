; DESCRIPTION: Composite: Sets a single blue pixel at (101, 183) then Renders a red line between points (391, 82) and (422, 66) then Draws a purple rectangle at (233, 110) with width 44 and height 39.
; PLAN: r0=101(x), r1=183(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=391(x1), r6=82(y1), r7=422(x2), r8=66(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=233(x), r11=110(y), r12=44(width), r13=39(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 101
LDI r1, 183
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 391
LDI r6, 82
LDI r7, 422
LDI r8, 66
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 233
LDI r11, 110
LDI r12, 44
LDI r13, 39
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
