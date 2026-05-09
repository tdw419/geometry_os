; DESCRIPTION: Composite: Renders a cyan line between points (477, 254) and (432, 99) then Renders a blue box of size 79x114 starting at (163, 4) then Places a white dot at position (42, 221).
; PLAN: r0=477(x1), r1=254(y1), r2=432(x2), r3=99(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=163(x), r6=4(y), r7=79(width), r8=114(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=42(x), r11=221(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 477
LDI r1, 254
LDI r2, 432
LDI r3, 99
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 163
LDI r6, 4
LDI r7, 79
LDI r8, 114
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 42
LDI r11, 221
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
