; DESCRIPTION: Composite: Sets a single purple pixel at (92, 174) then Draws a yellow rectangle at (235, 118) with width 98 and height 53 then Draws a yellow line from (452, 173) to (175, 103).
; PLAN: r0=92(x), r1=174(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=235(x), r6=118(y), r7=98(width), r8=53(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=452(x1), r11=173(y1), r12=175(x2), r13=103(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 92
LDI r1, 174
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 235
LDI r6, 118
LDI r7, 98
LDI r8, 53
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 452
LDI r11, 173
LDI r12, 175
LDI r13, 103
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
