; DESCRIPTION: Composite: Sets a single blue pixel at (26, 15) then Creates a magenta rectangular region at (207, 134) spanning 106 by 69 pixels then Renders a red line between points (96, 240) and (346, 163).
; PLAN: r0=26(x), r1=15(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=207(x), r6=134(y), r7=106(width), r8=69(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=96(x1), r11=240(y1), r12=346(x2), r13=163(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 26
LDI r1, 15
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 207
LDI r6, 134
LDI r7, 106
LDI r8, 69
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 96
LDI r11, 240
LDI r12, 346
LDI r13, 163
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
