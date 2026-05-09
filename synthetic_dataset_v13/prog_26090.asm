; DESCRIPTION: Composite: Draws a magenta rectangle at (148, 17) with width 11 and height 51 then Sets a single black pixel at (314, 236) then Draws a magenta line from (330, 166) to (183, 117).
; PLAN: r0=148(x), r1=17(y), r2=11(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=314(x), r6=236(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=330(x1), r11=166(y1), r12=183(x2), r13=117(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 148
LDI r1, 17
LDI r2, 11
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 236
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 330
LDI r11, 166
LDI r12, 183
LDI r13, 117
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
