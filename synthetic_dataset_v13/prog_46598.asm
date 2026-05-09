; DESCRIPTION: Composite: Sets a single purple pixel at (96, 35) then Renders a blue line between points (94, 249) and (400, 185) then Draws a magenta rectangle at (312, 145) with width 77 and height 11.
; PLAN: r0=96(x), r1=35(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=94(x1), r6=249(y1), r7=400(x2), r8=185(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=312(x), r11=145(y), r12=77(width), r13=11(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 96
LDI r1, 35
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 94
LDI r6, 249
LDI r7, 400
LDI r8, 185
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 312
LDI r11, 145
LDI r12, 77
LDI r13, 11
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
