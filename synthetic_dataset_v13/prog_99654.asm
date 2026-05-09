; DESCRIPTION: Composite: Renders a blue line between points (19, 29) and (59, 102) then Places a black circle of radius 50 at center (184, 72) then Renders a blue box of size 68x56 starting at (376, 122).
; PLAN: r0=19(x1), r1=29(y1), r2=59(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=184(x), r6=72(y), r7=50(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=376(x), r11=122(y), r12=68(width), r13=56(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 19
LDI r1, 29
LDI r2, 59
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 72
LDI r7, 50
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 376
LDI r11, 122
LDI r12, 68
LDI r13, 56
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
