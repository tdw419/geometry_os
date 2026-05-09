; DESCRIPTION: Composite: Sets a single blue pixel at (235, 5) then Draws a black rectangle at (259, 101) with width 91 and height 57 then Places a orange line segment connecting (90, 210) to (116, 115).
; PLAN: r0=235(x), r1=5(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=259(x), r6=101(y), r7=91(width), r8=57(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=90(x1), r11=210(y1), r12=116(x2), r13=115(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 235
LDI r1, 5
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 259
LDI r6, 101
LDI r7, 91
LDI r8, 57
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 90
LDI r11, 210
LDI r12, 116
LDI r13, 115
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
