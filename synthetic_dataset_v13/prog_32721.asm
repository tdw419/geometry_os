; DESCRIPTION: Composite: Creates a magenta rectangular region at (203, 110) spanning 90 by 105 pixels then Renders a red disk with center (77, 51) and radius 44 then Renders a red line between points (486, 125) and (58, 192).
; PLAN: r0=203(x), r1=110(y), r2=90(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=77(x), r6=51(y), r7=44(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=486(x1), r11=125(y1), r12=58(x2), r13=192(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 203
LDI r1, 110
LDI r2, 90
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 51
LDI r7, 44
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 486
LDI r11, 125
LDI r12, 58
LDI r13, 192
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
