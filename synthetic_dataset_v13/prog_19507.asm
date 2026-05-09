; DESCRIPTION: Composite: Draws a red line from (329, 39) to (129, 103) then Sets a single red pixel at (471, 104) then Draws a yellow rectangle at (27, 117) with width 37 and height 81.
; PLAN: r0=329(x1), r1=39(y1), r2=129(x2), r3=103(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=471(x), r6=104(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=27(x), r11=117(y), r12=37(width), r13=81(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 329
LDI r1, 39
LDI r2, 129
LDI r3, 103
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 471
LDI r6, 104
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 27
LDI r11, 117
LDI r12, 37
LDI r13, 81
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
