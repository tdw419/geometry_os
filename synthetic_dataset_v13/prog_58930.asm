; DESCRIPTION: Composite: Renders a green line between points (218, 122) and (421, 203) then Places a red dot at position (492, 105) then Draws a yellow rectangle at (466, 191) with width 30 and height 61.
; PLAN: r0=218(x1), r1=122(y1), r2=421(x2), r3=203(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=492(x), r6=105(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=466(x), r11=191(y), r12=30(width), r13=61(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 218
LDI r1, 122
LDI r2, 421
LDI r3, 203
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 492
LDI r6, 105
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 466
LDI r11, 191
LDI r12, 30
LDI r13, 61
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
