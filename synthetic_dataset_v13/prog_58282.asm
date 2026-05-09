; DESCRIPTION: Composite: Sets a single red pixel at (147, 131) then Draws a yellow line from (159, 109) to (111, 217) then Draws a blue rectangle at (177, 134) with width 88 and height 102.
; PLAN: r0=147(x), r1=131(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=159(x1), r6=109(y1), r7=111(x2), r8=217(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=177(x), r11=134(y), r12=88(width), r13=102(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 147
LDI r1, 131
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 159
LDI r6, 109
LDI r7, 111
LDI r8, 217
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 177
LDI r11, 134
LDI r12, 88
LDI r13, 102
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
