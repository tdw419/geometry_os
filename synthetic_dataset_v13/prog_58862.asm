; DESCRIPTION: Composite: Sets a single white pixel at (20, 136) then Creates a white rectangular region at (274, 37) spanning 74 by 87 pixels then Draws a red line from (46, 29) to (352, 65).
; PLAN: r0=20(x), r1=136(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=274(x), r6=37(y), r7=74(width), r8=87(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=46(x1), r11=29(y1), r12=352(x2), r13=65(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 20
LDI r1, 136
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 274
LDI r6, 37
LDI r7, 74
LDI r8, 87
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 46
LDI r11, 29
LDI r12, 352
LDI r13, 65
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
