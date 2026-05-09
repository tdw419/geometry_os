; DESCRIPTION: Composite: Places a white dot at position (457, 229) then Renders a blue line between points (3, 95) and (179, 10) then Creates a purple rectangular region at (68, 43) spanning 56 by 99 pixels.
; PLAN: r0=457(x), r1=229(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=3(x1), r6=95(y1), r7=179(x2), r8=10(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=68(x), r11=43(y), r12=56(width), r13=99(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 457
LDI r1, 229
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 3
LDI r6, 95
LDI r7, 179
LDI r8, 10
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 68
LDI r11, 43
LDI r12, 56
LDI r13, 99
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
