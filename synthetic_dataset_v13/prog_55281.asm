; DESCRIPTION: Composite: Draws a purple line from (303, 90) to (425, 80) then Sets a single magenta pixel at (481, 9) then Draws a black rectangle at (194, 74) with width 51 and height 44.
; PLAN: r0=303(x1), r1=90(y1), r2=425(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=481(x), r6=9(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=194(x), r11=74(y), r12=51(width), r13=44(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 303
LDI r1, 90
LDI r2, 425
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 481
LDI r6, 9
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 194
LDI r11, 74
LDI r12, 51
LDI r13, 44
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
