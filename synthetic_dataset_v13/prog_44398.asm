; DESCRIPTION: Composite: Draws a orange circle centered at (349, 95) with radius 72 then Places a purple 45x77 rectangle at position (28, 151) then Renders a orange line between points (34, 4) and (418, 114).
; PLAN: r0=349(x), r1=95(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=28(x), r6=151(y), r7=45(width), r8=77(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=34(x1), r11=4(y1), r12=418(x2), r13=114(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 349
LDI r1, 95
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 28
LDI r6, 151
LDI r7, 45
LDI r8, 77
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 34
LDI r11, 4
LDI r12, 418
LDI r13, 114
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
