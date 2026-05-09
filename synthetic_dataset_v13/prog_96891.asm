; DESCRIPTION: Composite: Draws a black rectangle at (51, 94) with width 115 and height 92 then Places a purple dot at position (167, 215) then Renders a orange line between points (59, 116) and (175, 173).
; PLAN: r0=51(x), r1=94(y), r2=115(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=167(x), r6=215(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=59(x1), r11=116(y1), r12=175(x2), r13=173(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 51
LDI r1, 94
LDI r2, 115
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 167
LDI r6, 215
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 59
LDI r11, 116
LDI r12, 175
LDI r13, 173
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
