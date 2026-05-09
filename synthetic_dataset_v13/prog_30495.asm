; DESCRIPTION: Composite: Draws a magenta line from (354, 92) to (43, 92) then Places a red dot at position (31, 179) then Creates a magenta rectangular region at (96, 37) spanning 62 by 13 pixels.
; PLAN: r0=354(x1), r1=92(y1), r2=43(x2), r3=92(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=31(x), r6=179(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=96(x), r11=37(y), r12=62(width), r13=13(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 354
LDI r1, 92
LDI r2, 43
LDI r3, 92
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 31
LDI r6, 179
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 96
LDI r11, 37
LDI r12, 62
LDI r13, 13
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
