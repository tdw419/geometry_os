; DESCRIPTION: Composite: Draws a white rectangle at (465, 166) with width 46 and height 79 then Sets a single red pixel at (11, 172) then Renders a purple line between points (171, 238) and (469, 7).
; PLAN: r0=465(x), r1=166(y), r2=46(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=11(x), r6=172(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=171(x1), r11=238(y1), r12=469(x2), r13=7(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 465
LDI r1, 166
LDI r2, 46
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 11
LDI r6, 172
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 171
LDI r11, 238
LDI r12, 469
LDI r13, 7
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
