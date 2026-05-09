; DESCRIPTION: Composite: Places a cyan line segment connecting (323, 89) to (408, 75) then Places a yellow 52x100 rectangle at position (101, 53) then Sets a single black pixel at (84, 134).
; PLAN: r0=323(x1), r1=89(y1), r2=408(x2), r3=75(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=101(x), r6=53(y), r7=52(width), r8=100(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=84(x), r11=134(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 323
LDI r1, 89
LDI r2, 408
LDI r3, 75
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 101
LDI r6, 53
LDI r7, 52
LDI r8, 100
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 84
LDI r11, 134
LDI r12, 0x000000
PSET r10, r11, r12
HALT
