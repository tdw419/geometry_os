; DESCRIPTION: Composite: Sets a single purple pixel at (144, 138) then Renders a black line between points (101, 95) and (48, 34) then Creates a blue rectangular region at (287, 86) spanning 30 by 20 pixels.
; PLAN: r0=144(x), r1=138(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=101(x1), r6=95(y1), r7=48(x2), r8=34(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=287(x), r11=86(y), r12=30(width), r13=20(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 144
LDI r1, 138
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 101
LDI r6, 95
LDI r7, 48
LDI r8, 34
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 287
LDI r11, 86
LDI r12, 30
LDI r13, 20
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
