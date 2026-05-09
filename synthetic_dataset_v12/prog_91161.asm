; DESCRIPTION: Composite: Creates a purple circular shape at (360, 68) with radius 43 then Draws a purple line from (6, 235) to (428, 145) then Places a magenta 92x76 rectangle at position (2, 83).
; PLAN: r0=360(x), r1=68(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=6(x1), r6=235(y1), r7=428(x2), r8=145(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=2(x), r11=83(y), r12=92(width), r13=76(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 360
LDI r1, 68
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 6
LDI r6, 235
LDI r7, 428
LDI r8, 145
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 2
LDI r11, 83
LDI r12, 92
LDI r13, 76
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
