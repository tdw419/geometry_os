; DESCRIPTION: Composite: Draws a purple line from (502, 182) to (1, 132) then Sets a single yellow pixel at (47, 235) then Draws a orange rectangle at (276, 140) with width 15 and height 63.
; PLAN: r0=502(x1), r1=182(y1), r2=1(x2), r3=132(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=47(x), r6=235(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=276(x), r11=140(y), r12=15(width), r13=63(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 502
LDI r1, 182
LDI r2, 1
LDI r3, 132
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 47
LDI r6, 235
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 276
LDI r11, 140
LDI r12, 15
LDI r13, 63
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
