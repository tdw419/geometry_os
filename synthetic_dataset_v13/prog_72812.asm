; DESCRIPTION: Composite: Sets a single white pixel at (275, 116) then Draws a orange rectangle at (252, 142) with width 38 and height 101 then Draws a purple line from (481, 79) to (95, 63).
; PLAN: r0=275(x), r1=116(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=252(x), r6=142(y), r7=38(width), r8=101(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=481(x1), r11=79(y1), r12=95(x2), r13=63(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 275
LDI r1, 116
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 252
LDI r6, 142
LDI r7, 38
LDI r8, 101
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 481
LDI r11, 79
LDI r12, 95
LDI r13, 63
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
