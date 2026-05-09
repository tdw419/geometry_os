; DESCRIPTION: Composite: Sets a single cyan pixel at (303, 148) then Draws a cyan rectangle at (316, 203) with width 94 and height 51 then Renders a green line between points (312, 179) and (56, 10).
; PLAN: r0=303(x), r1=148(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=316(x), r6=203(y), r7=94(width), r8=51(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=312(x1), r11=179(y1), r12=56(x2), r13=10(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 303
LDI r1, 148
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 316
LDI r6, 203
LDI r7, 94
LDI r8, 51
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 312
LDI r11, 179
LDI r12, 56
LDI r13, 10
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
