; DESCRIPTION: Composite: Sets a single magenta pixel at (477, 223) then Places a purple line segment connecting (461, 184) to (76, 195) then Draws a magenta rectangle at (192, 105) with width 92 and height 106.
; PLAN: r0=477(x), r1=223(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=461(x1), r6=184(y1), r7=76(x2), r8=195(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=192(x), r11=105(y), r12=92(width), r13=106(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 477
LDI r1, 223
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 461
LDI r6, 184
LDI r7, 76
LDI r8, 195
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 192
LDI r11, 105
LDI r12, 92
LDI r13, 106
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
