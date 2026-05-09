; DESCRIPTION: Composite: Creates a blue rectangular region at (167, 180) spanning 48 by 75 pixels then Places a orange line segment connecting (448, 239) to (53, 157) then Places a purple dot at position (344, 151).
; PLAN: r0=167(x), r1=180(y), r2=48(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=448(x1), r6=239(y1), r7=53(x2), r8=157(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=344(x), r11=151(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 167
LDI r1, 180
LDI r2, 48
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 448
LDI r6, 239
LDI r7, 53
LDI r8, 157
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 344
LDI r11, 151
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
