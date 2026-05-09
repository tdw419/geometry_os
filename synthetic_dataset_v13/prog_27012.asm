; DESCRIPTION: Composite: Renders a purple line between points (347, 85) and (476, 139) then Renders a red box of size 105x64 starting at (399, 8) then Places a purple dot at position (431, 169).
; PLAN: r0=347(x1), r1=85(y1), r2=476(x2), r3=139(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=399(x), r6=8(y), r7=105(width), r8=64(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=431(x), r11=169(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 347
LDI r1, 85
LDI r2, 476
LDI r3, 139
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 399
LDI r6, 8
LDI r7, 105
LDI r8, 64
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 431
LDI r11, 169
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
