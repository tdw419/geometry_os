; DESCRIPTION: Composite: Sets a single blue pixel at (252, 117) then Renders a blue line between points (509, 48) and (251, 69) then Draws a cyan rectangle at (324, 64) with width 88 and height 114.
; PLAN: r0=252(x), r1=117(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=509(x1), r6=48(y1), r7=251(x2), r8=69(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=324(x), r11=64(y), r12=88(width), r13=114(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 252
LDI r1, 117
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 509
LDI r6, 48
LDI r7, 251
LDI r8, 69
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 324
LDI r11, 64
LDI r12, 88
LDI r13, 114
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
