; DESCRIPTION: Composite: Places a purple line segment connecting (88, 9) to (135, 16) then Creates a cyan rectangular region at (116, 74) spanning 80 by 24 pixels then Places a white dot at position (476, 117).
; PLAN: r0=88(x1), r1=9(y1), r2=135(x2), r3=16(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=116(x), r6=74(y), r7=80(width), r8=24(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=476(x), r11=117(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 88
LDI r1, 9
LDI r2, 135
LDI r3, 16
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 74
LDI r7, 80
LDI r8, 24
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 476
LDI r11, 117
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
