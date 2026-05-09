; DESCRIPTION: Composite: Sets a single white pixel at (241, 4) then Draws a yellow line from (217, 95) to (409, 110) then Creates a yellow rectangular region at (32, 127) spanning 77 by 100 pixels.
; PLAN: r0=241(x), r1=4(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=217(x1), r6=95(y1), r7=409(x2), r8=110(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=32(x), r11=127(y), r12=77(width), r13=100(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 241
LDI r1, 4
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 217
LDI r6, 95
LDI r7, 409
LDI r8, 110
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 32
LDI r11, 127
LDI r12, 77
LDI r13, 100
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
