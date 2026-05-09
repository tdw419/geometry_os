; DESCRIPTION: Composite: Places a black line segment connecting (332, 36) to (312, 81) then Creates a green rectangular region at (1, 111) spanning 61 by 29 pixels then Places a orange dot at position (172, 16).
; PLAN: r0=332(x1), r1=36(y1), r2=312(x2), r3=81(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=1(x), r6=111(y), r7=61(width), r8=29(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=172(x), r11=16(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 332
LDI r1, 36
LDI r2, 312
LDI r3, 81
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 1
LDI r6, 111
LDI r7, 61
LDI r8, 29
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 172
LDI r11, 16
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
