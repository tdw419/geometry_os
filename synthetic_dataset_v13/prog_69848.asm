; DESCRIPTION: Composite: Draws a red rectangle at (350, 134) with width 63 and height 56 then Sets a single red pixel at (182, 114) then Places a yellow line segment connecting (452, 241) to (95, 85).
; PLAN: r0=350(x), r1=134(y), r2=63(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=182(x), r6=114(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=452(x1), r11=241(y1), r12=95(x2), r13=85(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 350
LDI r1, 134
LDI r2, 63
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 182
LDI r6, 114
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 452
LDI r11, 241
LDI r12, 95
LDI r13, 85
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
