; DESCRIPTION: Composite: Places a red line segment connecting (128, 158) to (76, 138) then Renders a blue box of size 71x84 starting at (25, 29) then Places a red dot at position (278, 152).
; PLAN: r0=128(x1), r1=158(y1), r2=76(x2), r3=138(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=25(x), r6=29(y), r7=71(width), r8=84(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=278(x), r11=152(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 128
LDI r1, 158
LDI r2, 76
LDI r3, 138
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 25
LDI r6, 29
LDI r7, 71
LDI r8, 84
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 278
LDI r11, 152
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
