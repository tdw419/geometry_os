; DESCRIPTION: Composite: Places a red line segment connecting (19, 139) to (366, 252) then Places a green dot at position (332, 190).
; PLAN: r0=19(x1), r1=139(y1), r2=366(x2), r3=252(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=332(x), r6=190(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 19
LDI r1, 139
LDI r2, 366
LDI r3, 252
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 190
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
