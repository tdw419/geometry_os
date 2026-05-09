; DESCRIPTION: Composite: Creates a magenta circular shape at (457, 81) with radius 14 then Places a purple line segment connecting (59, 235) to (291, 112) then Draws a magenta rectangle at (102, 145) with width 82 and height 54.
; PLAN: r0=457(x), r1=81(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=59(x1), r6=235(y1), r7=291(x2), r8=112(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=102(x), r11=145(y), r12=82(width), r13=54(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 457
LDI r1, 81
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 59
LDI r6, 235
LDI r7, 291
LDI r8, 112
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 102
LDI r11, 145
LDI r12, 82
LDI r13, 54
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
