; DESCRIPTION: Composite: Places a cyan 10x118 rectangle at position (142, 26) then Places a black line segment connecting (12, 68) to (256, 84) then Places a white dot at position (287, 106).
; PLAN: r0=142(x), r1=26(y), r2=10(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=12(x1), r6=68(y1), r7=256(x2), r8=84(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=287(x), r11=106(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 142
LDI r1, 26
LDI r2, 10
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 12
LDI r6, 68
LDI r7, 256
LDI r8, 84
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 287
LDI r11, 106
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
