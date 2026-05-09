; DESCRIPTION: Composite: Draws a cyan rectangle at (385, 183) with width 116 and height 51 then Places a yellow circle of radius 47 at center (422, 166) then Renders a orange line between points (38, 163) and (105, 36).
; PLAN: r0=385(x), r1=183(y), r2=116(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=422(x), r6=166(y), r7=47(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=38(x1), r11=163(y1), r12=105(x2), r13=36(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 385
LDI r1, 183
LDI r2, 116
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 166
LDI r7, 47
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 38
LDI r11, 163
LDI r12, 105
LDI r13, 36
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
