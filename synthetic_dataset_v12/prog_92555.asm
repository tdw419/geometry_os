; DESCRIPTION: Composite: Renders a purple disk with center (361, 55) and radius 51 then Draws a purple line from (316, 135) to (128, 19) then Sets a single red pixel at (44, 67).
; PLAN: r0=361(x), r1=55(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=316(x1), r6=135(y1), r7=128(x2), r8=19(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=44(x), r11=67(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 361
LDI r1, 55
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 316
LDI r6, 135
LDI r7, 128
LDI r8, 19
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 44
LDI r11, 67
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
