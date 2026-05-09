; DESCRIPTION: Composite: Sets a single white pixel at (294, 0) then Creates a black rectangular region at (222, 96) spanning 102 by 38 pixels then Draws a white line from (417, 200) to (178, 135).
; PLAN: r0=294(x), r1=0(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=222(x), r6=96(y), r7=102(width), r8=38(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=417(x1), r11=200(y1), r12=178(x2), r13=135(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 294
LDI r1, 0
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 222
LDI r6, 96
LDI r7, 102
LDI r8, 38
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 417
LDI r11, 200
LDI r12, 178
LDI r13, 135
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
