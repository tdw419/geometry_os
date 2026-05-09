; DESCRIPTION: Composite: Draws a black line from (217, 81) to (471, 253) then Places a blue dot at position (424, 157) then Draws a cyan rectangle at (467, 101) with width 43 and height 15.
; PLAN: r0=217(x1), r1=81(y1), r2=471(x2), r3=253(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=424(x), r6=157(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=467(x), r11=101(y), r12=43(width), r13=15(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 217
LDI r1, 81
LDI r2, 471
LDI r3, 253
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 424
LDI r6, 157
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 467
LDI r11, 101
LDI r12, 43
LDI r13, 15
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
