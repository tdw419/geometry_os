; DESCRIPTION: Composite: Sets a single purple pixel at (273, 52) then Creates a black rectangular region at (233, 171) spanning 78 by 79 pixels then Draws a orange line from (502, 15) to (96, 69).
; PLAN: r0=273(x), r1=52(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=233(x), r6=171(y), r7=78(width), r8=79(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=502(x1), r11=15(y1), r12=96(x2), r13=69(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 273
LDI r1, 52
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 233
LDI r6, 171
LDI r7, 78
LDI r8, 79
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 502
LDI r11, 15
LDI r12, 96
LDI r13, 69
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
