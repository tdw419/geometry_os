; DESCRIPTION: Composite: Creates a purple circular shape at (41, 80) with radius 26 then Places a cyan line segment connecting (494, 232) to (58, 190) then Sets a single red pixel at (477, 167).
; PLAN: r0=41(x), r1=80(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=494(x1), r6=232(y1), r7=58(x2), r8=190(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=477(x), r11=167(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 41
LDI r1, 80
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 494
LDI r6, 232
LDI r7, 58
LDI r8, 190
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 477
LDI r11, 167
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
