; DESCRIPTION: Composite: Places a black 19x40 rectangle at position (156, 162) then Draws a black line from (217, 130) to (135, 192) then Sets a single red pixel at (261, 230).
; PLAN: r0=156(x), r1=162(y), r2=19(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=217(x1), r6=130(y1), r7=135(x2), r8=192(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=261(x), r11=230(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 156
LDI r1, 162
LDI r2, 19
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 130
LDI r7, 135
LDI r8, 192
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 261
LDI r11, 230
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
