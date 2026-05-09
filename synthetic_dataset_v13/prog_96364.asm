; DESCRIPTION: Composite: Places a black dot at position (366, 35) then Draws a red rectangle at (453, 144) with width 49 and height 31 then Places a orange line segment connecting (86, 48) to (332, 96).
; PLAN: r0=366(x), r1=35(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=453(x), r6=144(y), r7=49(width), r8=31(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=86(x1), r11=48(y1), r12=332(x2), r13=96(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 366
LDI r1, 35
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 453
LDI r6, 144
LDI r7, 49
LDI r8, 31
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 86
LDI r11, 48
LDI r12, 332
LDI r13, 96
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
