; DESCRIPTION: Composite: Places a orange 80x77 rectangle at position (373, 49) then Sets a single purple pixel at (385, 95) then Renders a blue line between points (74, 88) and (106, 184).
; PLAN: r0=373(x), r1=49(y), r2=80(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=385(x), r6=95(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=74(x1), r11=88(y1), r12=106(x2), r13=184(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 373
LDI r1, 49
LDI r2, 80
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 385
LDI r6, 95
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 74
LDI r11, 88
LDI r12, 106
LDI r13, 184
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
