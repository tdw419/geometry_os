; DESCRIPTION: Composite: Places a purple circle of radius 43 at center (453, 113) then Sets a single orange pixel at (501, 227) then Places a red 46x113 rectangle at position (304, 75).
; PLAN: r0=453(x), r1=113(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=501(x), r6=227(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=304(x), r11=75(y), r12=46(width), r13=113(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 453
LDI r1, 113
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 501
LDI r6, 227
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 304
LDI r11, 75
LDI r12, 46
LDI r13, 113
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
