; DESCRIPTION: Composite: Places a magenta dot at position (377, 222) then Draws a blue line from (429, 17) to (191, 87) then Creates a red rectangular region at (111, 15) spanning 106 by 107 pixels.
; PLAN: r0=377(x), r1=222(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=429(x1), r6=17(y1), r7=191(x2), r8=87(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=111(x), r11=15(y), r12=106(width), r13=107(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 377
LDI r1, 222
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 429
LDI r6, 17
LDI r7, 191
LDI r8, 87
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 111
LDI r11, 15
LDI r12, 106
LDI r13, 107
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
