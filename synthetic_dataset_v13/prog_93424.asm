; DESCRIPTION: Composite: Sets a single blue pixel at (189, 248) then Draws a white line from (262, 167) to (188, 135) then Draws a orange rectangle at (19, 105) with width 53 and height 100.
; PLAN: r0=189(x), r1=248(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=262(x1), r6=167(y1), r7=188(x2), r8=135(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=19(x), r11=105(y), r12=53(width), r13=100(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 189
LDI r1, 248
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 262
LDI r6, 167
LDI r7, 188
LDI r8, 135
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 19
LDI r11, 105
LDI r12, 53
LDI r13, 100
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
