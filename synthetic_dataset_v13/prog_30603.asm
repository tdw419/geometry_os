; DESCRIPTION: Composite: Places a black dot at position (27, 170) then Renders a magenta box of size 70x74 starting at (376, 162) then Draws a blue line from (70, 170) to (85, 248).
; PLAN: r0=27(x), r1=170(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=376(x), r6=162(y), r7=70(width), r8=74(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=70(x1), r11=170(y1), r12=85(x2), r13=248(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 27
LDI r1, 170
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 376
LDI r6, 162
LDI r7, 70
LDI r8, 74
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 70
LDI r11, 170
LDI r12, 85
LDI r13, 248
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
