; DESCRIPTION: Composite: Sets a single magenta pixel at (88, 53) then Places a red line segment connecting (82, 53) to (426, 19) then Creates a orange rectangular region at (347, 201) spanning 115 by 28 pixels.
; PLAN: r0=88(x), r1=53(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=82(x1), r6=53(y1), r7=426(x2), r8=19(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=347(x), r11=201(y), r12=115(width), r13=28(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 88
LDI r1, 53
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 82
LDI r6, 53
LDI r7, 426
LDI r8, 19
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 347
LDI r11, 201
LDI r12, 115
LDI r13, 28
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
