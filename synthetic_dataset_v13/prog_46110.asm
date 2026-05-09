; DESCRIPTION: Composite: Renders a orange box of size 19x82 starting at (122, 31) then Places a white dot at position (330, 101) then Renders a black line between points (158, 203) and (353, 119).
; PLAN: r0=122(x), r1=31(y), r2=19(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=330(x), r6=101(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=158(x1), r11=203(y1), r12=353(x2), r13=119(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 122
LDI r1, 31
LDI r2, 19
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 101
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 158
LDI r11, 203
LDI r12, 353
LDI r13, 119
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
