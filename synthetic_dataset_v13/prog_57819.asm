; DESCRIPTION: Composite: Sets a single orange pixel at (173, 63) then Draws a magenta rectangle at (370, 162) with width 36 and height 58 then Renders a orange line between points (497, 148) and (226, 83).
; PLAN: r0=173(x), r1=63(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=370(x), r6=162(y), r7=36(width), r8=58(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=497(x1), r11=148(y1), r12=226(x2), r13=83(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 173
LDI r1, 63
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 370
LDI r6, 162
LDI r7, 36
LDI r8, 58
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 497
LDI r11, 148
LDI r12, 226
LDI r13, 83
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
