; DESCRIPTION: Composite: Places a magenta circle of radius 74 at center (250, 178) then Creates a purple rectangular region at (449, 34) spanning 22 by 92 pixels then Draws a red line from (19, 228) to (58, 63).
; PLAN: r0=250(x), r1=178(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=449(x), r6=34(y), r7=22(width), r8=92(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=19(x1), r11=228(y1), r12=58(x2), r13=63(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 250
LDI r1, 178
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 449
LDI r6, 34
LDI r7, 22
LDI r8, 92
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 19
LDI r11, 228
LDI r12, 58
LDI r13, 63
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
