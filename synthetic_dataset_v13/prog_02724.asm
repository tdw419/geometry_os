; DESCRIPTION: Composite: Sets a single white pixel at (77, 191) then Renders a magenta line between points (262, 108) and (1, 158) then Draws a magenta rectangle at (179, 201) with width 111 and height 11.
; PLAN: r0=77(x), r1=191(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=262(x1), r6=108(y1), r7=1(x2), r8=158(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=179(x), r11=201(y), r12=111(width), r13=11(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 77
LDI r1, 191
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 262
LDI r6, 108
LDI r7, 1
LDI r8, 158
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 179
LDI r11, 201
LDI r12, 111
LDI r13, 11
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
