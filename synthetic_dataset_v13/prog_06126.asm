; DESCRIPTION: Composite: Sets a single black pixel at (313, 1) then Draws a purple rectangle at (25, 132) with width 103 and height 90 then Renders a magenta line between points (285, 99) and (155, 52).
; PLAN: r0=313(x), r1=1(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=25(x), r6=132(y), r7=103(width), r8=90(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=285(x1), r11=99(y1), r12=155(x2), r13=52(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 313
LDI r1, 1
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 25
LDI r6, 132
LDI r7, 103
LDI r8, 90
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 285
LDI r11, 99
LDI r12, 155
LDI r13, 52
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
