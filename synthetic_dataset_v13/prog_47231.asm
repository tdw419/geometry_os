; DESCRIPTION: Composite: Draws a orange rectangle at (167, 155) with width 51 and height 93 then Sets a single red pixel at (276, 103) then Draws a yellow line from (475, 146) to (231, 250).
; PLAN: r0=167(x), r1=155(y), r2=51(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=276(x), r6=103(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=475(x1), r11=146(y1), r12=231(x2), r13=250(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 167
LDI r1, 155
LDI r2, 51
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 103
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 475
LDI r11, 146
LDI r12, 231
LDI r13, 250
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
