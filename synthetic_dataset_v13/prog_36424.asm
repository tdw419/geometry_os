; DESCRIPTION: Composite: Draws a purple rectangle at (244, 115) with width 114 and height 110 then Places a red line segment connecting (195, 150) to (495, 48) then Places a red dot at position (64, 28).
; PLAN: r0=244(x), r1=115(y), r2=114(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=195(x1), r6=150(y1), r7=495(x2), r8=48(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=64(x), r11=28(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 244
LDI r1, 115
LDI r2, 114
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 195
LDI r6, 150
LDI r7, 495
LDI r8, 48
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 64
LDI r11, 28
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
