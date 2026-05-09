; DESCRIPTION: Composite: Sets a single cyan pixel at (411, 94) then Renders a blue line between points (8, 128) and (467, 15) then Draws a black rectangle at (81, 59) with width 71 and height 88.
; PLAN: r0=411(x), r1=94(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=8(x1), r6=128(y1), r7=467(x2), r8=15(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=81(x), r11=59(y), r12=71(width), r13=88(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 411
LDI r1, 94
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 8
LDI r6, 128
LDI r7, 467
LDI r8, 15
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 81
LDI r11, 59
LDI r12, 71
LDI r13, 88
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
