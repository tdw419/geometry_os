; DESCRIPTION: Composite: Sets a single green pixel at (411, 22) then Places a red 45x80 rectangle at position (54, 77) then Renders a purple line between points (172, 255) and (324, 127).
; PLAN: r0=411(x), r1=22(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=54(x), r6=77(y), r7=45(width), r8=80(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=172(x1), r11=255(y1), r12=324(x2), r13=127(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 411
LDI r1, 22
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 54
LDI r6, 77
LDI r7, 45
LDI r8, 80
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 172
LDI r11, 255
LDI r12, 324
LDI r13, 127
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
