; DESCRIPTION: Composite: Places a black dot at position (110, 252) then Draws a cyan line from (100, 35) to (93, 158) then Places a red circle of radius 67 at center (444, 123).
; PLAN: r0=110(x), r1=252(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=100(x1), r6=35(y1), r7=93(x2), r8=158(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=444(x), r11=123(y), r12=67(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 110
LDI r1, 252
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 100
LDI r6, 35
LDI r7, 93
LDI r8, 158
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 444
LDI r11, 123
LDI r12, 67
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
