; DESCRIPTION: Composite: Renders a red line between points (77, 145) and (310, 166) then Sets a single white pixel at (11, 36) then Creates a white rectangular region at (53, 69) spanning 109 by 114 pixels.
; PLAN: r0=77(x1), r1=145(y1), r2=310(x2), r3=166(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=11(x), r6=36(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=53(x), r11=69(y), r12=109(width), r13=114(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 77
LDI r1, 145
LDI r2, 310
LDI r3, 166
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 11
LDI r6, 36
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 53
LDI r11, 69
LDI r12, 109
LDI r13, 114
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
