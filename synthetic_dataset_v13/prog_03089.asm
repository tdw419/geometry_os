; DESCRIPTION: Composite: Sets a single magenta pixel at (320, 81) then Draws a purple line from (56, 90) to (467, 217) then Draws a red circle centered at (316, 96) with radius 10.
; PLAN: r0=320(x), r1=81(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=56(x1), r6=90(y1), r7=467(x2), r8=217(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=316(x), r11=96(y), r12=10(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 320
LDI r1, 81
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 56
LDI r6, 90
LDI r7, 467
LDI r8, 217
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 316
LDI r11, 96
LDI r12, 10
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
