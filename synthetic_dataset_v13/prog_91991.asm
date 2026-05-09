; DESCRIPTION: Composite: Places a white 62x93 rectangle at position (419, 124) then Draws a yellow line from (432, 153) to (102, 38) then Creates a magenta circular shape at (83, 96) with radius 18.
; PLAN: r0=419(x), r1=124(y), r2=62(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=432(x1), r6=153(y1), r7=102(x2), r8=38(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=83(x), r11=96(y), r12=18(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 419
LDI r1, 124
LDI r2, 62
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 153
LDI r7, 102
LDI r8, 38
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 83
LDI r11, 96
LDI r12, 18
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
