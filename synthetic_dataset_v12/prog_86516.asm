; DESCRIPTION: Composite: Renders a blue line between points (11, 183) and (472, 70) then Places a orange dot at position (270, 252) then Renders a orange box of size 84x82 starting at (365, 169).
; PLAN: r0=11(x1), r1=183(y1), r2=472(x2), r3=70(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=270(x), r6=252(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=365(x), r11=169(y), r12=84(width), r13=82(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 11
LDI r1, 183
LDI r2, 472
LDI r3, 70
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 252
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 365
LDI r11, 169
LDI r12, 84
LDI r13, 82
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
