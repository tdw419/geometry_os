; DESCRIPTION: Composite: Places a yellow dot at position (178, 85) then Renders a purple line between points (106, 247) and (264, 222) then Creates a magenta rectangular region at (138, 116) spanning 70 by 92 pixels.
; PLAN: r0=178(x), r1=85(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=106(x1), r6=247(y1), r7=264(x2), r8=222(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=138(x), r11=116(y), r12=70(width), r13=92(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 178
LDI r1, 85
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 106
LDI r6, 247
LDI r7, 264
LDI r8, 222
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 138
LDI r11, 116
LDI r12, 70
LDI r13, 92
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
