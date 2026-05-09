; DESCRIPTION: Composite: Places a cyan 58x90 rectangle at position (86, 111) then Renders a purple line between points (238, 22) and (343, 54) then Places a black dot at position (364, 185).
; PLAN: r0=86(x), r1=111(y), r2=58(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=238(x1), r6=22(y1), r7=343(x2), r8=54(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=364(x), r11=185(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 86
LDI r1, 111
LDI r2, 58
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 22
LDI r7, 343
LDI r8, 54
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 364
LDI r11, 185
LDI r12, 0x000000
PSET r10, r11, r12
HALT
