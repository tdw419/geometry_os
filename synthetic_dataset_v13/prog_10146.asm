; DESCRIPTION: Composite: Draws a orange line from (473, 85) to (313, 92) then Renders a black disk with center (141, 180) and radius 32 then Draws a black rectangle at (31, 113) with width 107 and height 36.
; PLAN: r0=473(x1), r1=85(y1), r2=313(x2), r3=92(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=141(x), r6=180(y), r7=32(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=31(x), r11=113(y), r12=107(width), r13=36(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 473
LDI r1, 85
LDI r2, 313
LDI r3, 92
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 180
LDI r7, 32
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 31
LDI r11, 113
LDI r12, 107
LDI r13, 36
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
